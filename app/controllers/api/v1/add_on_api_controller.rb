class Api::V1::AddOnApiController < ApiController
    before_action :set_addon, only: [:show, :contact_us, :install]

    # GET /add_on
    def index
        @addons = AddOn.all
        res = AddOnBlueprint.render_as_json(@addons, root: :add_ons)
        json_response(res)
        # render json: res
    end

     # GET /add_ons/1 or /add_ons/1.json
    def show
        res = AddOnBlueprint.render_as_json(@addon, root: :add_on)
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
        byebug
        if @demo.save
            res = RequestDemoBlueprint.render_as_json(@demo, root: :request_demo)
            json_response(res)
        else
            # Fail save
            byebug
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
