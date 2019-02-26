require_relative '../config/environment.rb'
    taco=Recipe.new("Taco")
    hamburger=Recipe.new("Hamburger")
    cheeserice=Recipe.new("CheesyRice")
    breadrice=Recipe.new("BreadRice??")

    chef=User.new("Chef")
    chef2=User.new("Chef2")
    
    cheese = Ingredient.new("Cheese")
    rice = Ingredient.new("Rice")
    patti = Ingredient.new("Patti")
    bread = Ingredient.new("Bread")

    chef.declare_allergen(cheese)
    chef.declare_allergen(rice)
    chef2.declare_allergen(bread)
    chef2.declare_allergen(cheese)

    ingredients=[cheese, rice]
    ingredients2=[bread, patti]
    ingredients3=[bread, rice]

    taco.add_ingredients(ingredients)
    hamburger.add_ingredients(ingredients2)
    cheeserice.add_ingredients(ingredients)
    breadrice.add_ingredients(ingredients3)

    rc1 = chef.add_recipe_card(taco, "today", 5)
    rc2 = chef.add_recipe_card(hamburger, "today", 4)
    rc3= chef.add_recipe_card(cheeserice, "today", 3)
    rc4 = chef.add_recipe_card(breadrice, "today", 2)
    rc3 = chef2.add_recipe_card(hamburger, "today", 3)

    



binding.pry
0