class User
    @@all=[]

    attr_accessor :name

    def initialize(name)
        @name=name
        @@all.push(self)
    end

    def self.all
        @@all
    end

    def declare_allergen(ingredient)
        Allergen.new(self, ingredient)
    end

    def allergens
        list = []
        Allergen.all.each do |ac|
            if ac.user == self
                list << ac.ingredient
            end
        end
        list
    end

    def add_recipe_card(recipe, date, rating)
        RecipeCard.new(self, recipe, date, rating)
    end

    def recipe_cards
        RecipeCard.all.select do |rc|
            rc.user == self
        end
    end

    def recipes
        recipe_cards.map do |rc|
            rc.recipe
        end
    end

    def top_three_recipes
        arr=recipe_cards.sort_by { |rc| rc.rating }.reverse
        arr.map {|rc| rc.recipe}[0..2]
    end

    #assuming most recent recipe is the one most recently added to RecipeCard array (not by date)
    def most_recent_recipe
        recipe_cards[-1].recipe
    end



    
end