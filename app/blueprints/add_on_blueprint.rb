class AddOnBlueprint < Blueprinter::Base
    identifier :id
    fields :contact_email, :author, :description, :name, :icon_url
    
    view :detail do
        fields :how_to_install, :images
    end
end
