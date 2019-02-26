class Recipe
    @@all=[]

    attr_reader :name, :ingredients

    def initialize (name)
        @name=name
        @ingredients=[]
        @@all.push(self)
    end

    def self.most_popular
        counts={}
        max=nil
        RecipeCard.all.each do |rc|
            #if hash does not contain ingredient--creates key for ingredient and assigns it's value to 1
            if(counts[rc.recipe])==nil
                counts[rc.recipe]=1
            #otherwise- increments that key's value
            else
                counts[rc.recipe]+=1
            end
            #setting max to the first key added to our hash
            if (max==nil)
                max=rc.recipe
            #if the counbt of the current ingredient > count of max-- max reassigned to that ingredient
            elsif (counts[rc.recipe]>counts[max])
                max=rc.recipe
            end
        end
        #returns max-- the actual name of the ingredient-- NOT a number
        max 
    end

    def add_ingredients (ingredients)
        @ingredients.push(ingredients).flatten!
        @ingredients.each do |ing|
            RecipeIngredient.new(self, ing)
        end
    end

    def add_recipe_card(user, date, rating)
        RecipeCard.new(user, self, date, rating)
    end

    def recipe_cards
        RecipeCard.all.select do |rc|
            rc.recipe == self
        end
    end

    def users
        recipe_cards.map do |rc|
            rc.user
        end
    end

    def self.all
        @@all
    end

    def allergens
        list = []
        @ingredients.each do |ing|
            Allergen.all.each do |al|
                if al.ingredient == ing 
                    list << ing
                end
            end
        end
        list
    end

end