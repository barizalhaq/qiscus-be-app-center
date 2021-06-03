class Api::V1::CategoryApiController < ApiController
    def index
        categories = Category.all
        blueprint = CategoryBlueprint.render_as_json(categories)
        json_response(blueprint)
    end
end