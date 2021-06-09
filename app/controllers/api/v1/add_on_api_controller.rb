class Api::V1::AddOnApiController < ApiController
    before_action :set_addon, only: [:show, :contact_us, :install]

    # GET /add_on
    def index
        @addons = AddOn.where(published: true)
            .where('name ILIKE ?', "%#{params[:name]}%")
            .order("name #{params[:sort]}")

        if params[:per_page].present?
            @addons = @addons.page(params[:page] || 1).per(params[:per_page])
        end

        if  params[:category].present?
            @addons = @addons.joins(:category).where('title ILIKE ?',"%#{params[:category]}%")
        end

        res = AddOnBlueprint.render_as_json(@addons, root: :add_ons, current_app: @current_app)

        json_response(pagination_meta(res))
    end

    # TODO : change with real data
    def my_add_on
        @addons = @current_app.my_add_ons
        res = AddOnBlueprint.render_as_json(@addons, root: :add_ons, view: :my_add_on, current_app: @current_app)
        json_response(res)
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
        demoExist = RequestDemo.where("add_on_id = ?", @addon.id)
            .where("app_id = ?", @current_app.id)
            .where("status = ?", 3)
            .present?

        if demoExist
            @demo = RequestDemo.where("add_on_id = ?", @addon.id)
                .where("app_id = ?", @current_app.id)
                .first

            @demo.name = params[:name]
            @demo.reason = params[:reason]
            @demo.reason = params[:description]
            @demo.contact_email = params[:contact_email]
            @demo.contact_phone = params[:contact_phone]
            @demo.status = 0
        else
            @demo = RequestDemo.new(name: params[:name], reason: params[:description], contact_email: params[:contact_email], contact_phone: params[:contact_phone], status: 0)
            @demo.add_on = @addon
            @demo.app = @current_app
        end

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
    def pagination_meta(res)
        begin
            links = {}
            links["first_page"] = page_link(1) unless @addons.first_page?
            links["next_page"] = page_link(@addons.next_page) if @addons.next_page
            links["prev_page"] = page_link(@addons.next_page) if @addons.next_page
            links["last_page"] = page_link(@addons.total_pages) unless @addons.last_page?

            res["meta"] = {
                "total_count": @addons.total_count,
                "current_page": @addons.current_page,
                "last_page": @addons.total_pages,
                "links": links
            }
        rescue
            return res
        end

        return res
    end

    def page_link(page)
        "#{api_v1_add_on_url(request.query_parameters.merge(page: page))}"
    end
end
