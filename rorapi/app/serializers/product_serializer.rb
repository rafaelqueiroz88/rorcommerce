class ProductBlueprint < Blueprinter::Base
    
    identifier :id
    
    view :normal do
        fields :name, :value, :tags
    end

    view :extended do
        include_view :normal
        exclude :id
        # Caso queira utilizar associação...
        # association :author, blueprint: AuthorBlueprint, view: :normal
    end
end