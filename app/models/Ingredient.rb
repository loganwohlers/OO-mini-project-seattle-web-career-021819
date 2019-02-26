class Ingredient
    @@all=[]

    attr_accessor :name

    def initialize(name)
        @name=name
        #@ingredients=ingredients
        @@all.push(self)
    end

     def self.most_common_allergen
        counts={}
        max=nil
        Allergen.all.each do |allergen|
            if(counts[allergen.ingredient])==nil
                counts[allergen.ingredient]=1
            else
                counts[allergen.ingredient]+=1
            end

            if (max==nil)
                max=allergen.ingredient
            elsif (counts[allergen.ingredient]>counts[max])
                max=allergin.ingredient
            end
        end
        max 
     end

    def self.all
        @@all
    end
end
