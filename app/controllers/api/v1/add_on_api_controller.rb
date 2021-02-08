class Api::V1::AddOnApiController < ApiController
    before_action :set_addon, only: [:show]

    # GET /add_on
    def index
        @addons = AddOn.all
        res = AddOnBlueprint.render_as_json(@addons)
        json_response(res)
        # render json: res
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
