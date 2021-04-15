class AddOnBlueprint < Blueprinter::Base
    identifier :id
    fields :contact_email, :author, :caption, :name, :icon_url
    field :status do |add_on, options|
        demo = add_on.request_demos.find { |demo| demo.app_id == options[:current_app].id }
        demo.status unless demo == nil
    end

    view :detail do
        fields :description, :how_to_install, :setting_url
        field :installed do |add_on, options|
            options[:current_app].subscriptions.any? { |item| item[:add_on_id] == add_on.id }
        end
        field :images do |add_on|
            add_on.getImages
        end
    end

    view :my_add_on do
        fields :setting_url
    end

end
