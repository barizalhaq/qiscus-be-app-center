class AddOnBlueprint < Blueprinter::Base
    identifier :id
    fields :contact_email, :author, :description, :name, :how_to_install, :icon_url, :images

end
