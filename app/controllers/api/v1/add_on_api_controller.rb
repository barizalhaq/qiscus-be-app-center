class Api::V1::AddOnApiController < ApiController
    before_action :set_addon, only: [:show, :contact_us, :install]

    # GET /add_on
    def index
        @addons = AddOn.where(published: true)
        res = AddOnBlueprint.render_as_json(@addons, root: :add_ons)
        json_response(res)
        # render json: res
    end

    # TODO : change with real data
    def my_add_on
        @addons = @current_app.my_add_ons
        res = AddOnBlueprint.render_as_json(@addons, root: :add_ons, view: :my_add_on)
        json_response(res)
        # render json: res
    end

     # GET /add_ons/1 or /add_ons/1.json
    def show
        installed_add_ons = @current_app.subscriptions
        res = AddOnBlueprint.render_as_json(@addon, root: :add_on, view: :detail, installed: installed_add_ons)
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
end
