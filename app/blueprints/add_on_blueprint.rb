class AddOnBlueprint < Blueprinter::Base
    identifier :id
    fields :contact_email, :author, :caption, :name, :icon_url
    
    view :detail do
        fields :description, :how_to_install, :images
    end

    view :my_add_on do
        include_view :detail
        field :setting_url
    end

end
