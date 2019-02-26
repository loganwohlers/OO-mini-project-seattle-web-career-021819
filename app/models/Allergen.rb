class Allergen
    @@all=[]

    attr_accessor :user, :ingredient

    def initialize(user, ingredient)
        @user=user
        @ingredient=ingredient
        @@all.push(self)
    end

    def self.all
        @@all
    end
end