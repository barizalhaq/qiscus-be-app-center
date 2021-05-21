class Api::V1::AddOnApiController < ApiController
    before_action :set_addon, only: [:show, :contact_us, :install]

    # GET /add_on
    def index
        @addons = AddOn.where(published: true)
            .where('name ILIKE ?', "%#{params[:name]}%")
            .order("name #{params[:sort]}")

        if params[:per_page].present?
            @addons = @addons.page(params[:page] || 1).per(params[:per_page])
            set_pagination_headers
        end

        res = AddOnBlueprint.render_as_json(@addons, root: :add_ons, current_app: @current_app)
        json_response(res)
    end

    # TODO : change with real data
    def my_add_on
        @addons = @current_app.my_add_ons
        res = AddOnBlueprint.render_as_json(@addons, root: :add_ons, view: :my_add_on, current_app: @current_app)
        json_response(res)
        # render json: res
    end

    # GET /add_ons/1 or /add_ons/1.json
    def show
        res = AddOnBlueprint.render_as_json(@addon, root: :add_on, view: :detail, current_app: @current_app)
        json_response(res)
    end

    def install
        res = AddOnBlueprint.render_as_json(@addon, root: :add_on)
        json_response(res)
    end

    def contact_us
        @demo = RequestDemo.new(name: params[:name], reason: params[:description], contact_email: params[:contact_email], contact_phone: params[:contact_phone], status: 0)
        @demo.add_on = @addon
        @demo.app = @current_app
        if @demo.save
            res = RequestDemoBlueprint.render_as_json(@demo, root: :request_demo)
            json_response(res)
            # Send notification
            SlackApi.new.notif(@demo)
        else
            # Fail save
            json_response({ message: "Failed to request for demo or request has already in process" }, :not_found)
            
        end
    end

    private
    def todo_params
        # whitelist params
        params.permit(:id, :name)
    end

    def set_addon
        @addon = AddOn.find(params[:id])
    end

    # Pagination information headers
    private
    def set_pagination_headers
        headers["X-TOTAL-COUNT"] = @addons.total_count
        headers["X-PAGE"] = @addons.current_page
        headers["X-LAST-PAGE"] = @addons.total_pages
        links = []

        links << page_link(1, "first") unless @addons.first_page?
        links << page_link(@addons.prev_page, "prev") if @addons.prev_page
        links << page_link(@addons.next_page, "next") if @addons.next_page
        links << page_link(@addons.total_pages, "last") unless @addons.last_page?

        headers["Links"] = links.join(", ") if links.present?
    end

    def page_link(page, rel)
        "<#{api_v1_add_on_url(request.query_parameters.merge(page: page))}>; rel='#{rel}'"
    end
end
