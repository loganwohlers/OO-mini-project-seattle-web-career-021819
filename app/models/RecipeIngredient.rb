class RecipeIngredient
    @@all=[]

    attr_reader :recipe, :ingredient

    def initialize(recipe, ingredient)
        @recipe=recipe
        @ingredient=ingredient
        @@all.push(self)
    end

    def self.all
        @@all
    end
end # end of class