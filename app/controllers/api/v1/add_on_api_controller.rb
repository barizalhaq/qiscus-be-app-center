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
        byebug
        res = AddOnBlueprint.render_as_json(@addon, root: :add_on)
        json_response(res)
    end

    def install
        res = AddOnBlueprint.render_as_json(@addon, root: :add_on)
        json_response(res)
    end

    def request
        # logger.debug demo_params
        # @req = RequestDemo.new(demo_params)
        # @req.add_on = @addon
        # @req.app = App.first

        # if @req.save
        # # 
        #     json_response(@req, root: :request_demo)
        # else
        # # 
        #     json_response(nil, :error)
        # end
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
