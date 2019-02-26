class RecipeCard
    @@all=[]

    attr_reader :user, :recipe, :date, :rating

    def initialize(user, recipe, date, rating)
        @user=user
        @recipe=recipe
        @date=date
        @rating=rating
        @@all.push(self)
    end

    def self.all
        @@all
    end
end