class UserBlueprint < Blueprinter::Base
    
    identifier :id
    
    view :normal do
        fields :email, :password
    end

    view :advanced do
        exclude :id
        fields :email
        # exemplo de uso para caso queira fazer uma associação
        # association :author, blueprint: AuthorBlueprint, view: :normal
    end
end