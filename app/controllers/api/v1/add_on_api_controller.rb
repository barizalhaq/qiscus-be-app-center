class Api::V1::AddOnApiController < ApplicationController
    before_action :set_addon, only: [:show]

    # GET /todos
    def index
        @addons = AddOn.all
        json_response(@addons)
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
