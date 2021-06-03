ActiveAdmin.register Category do
    menu label: "Add On Category"

    permit_params :title
end