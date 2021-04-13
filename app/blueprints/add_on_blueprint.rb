class AddOnBlueprint < Blueprinter::Base
    identifier :id
    fields :contact_email, :author, :caption, :name, :icon_url

    view :detail do
        fields :description, :how_to_install, :setting_url
        field :installed do |add_on, options|
            options[:installed].any? { |item| item[:add_on_id] == add_on.id }
        end
        field :images do |add_on|
            add_on.getImages
        end
    end

    view :my_add_on do
        fields :images, :setting_url
    end

end
