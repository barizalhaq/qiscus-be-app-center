class Api::V1::AddOnApiController < ApiController
    before_action :set_addon, only: [:show]

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
