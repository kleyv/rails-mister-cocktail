# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_serialized = open(url).read
ingredient = JSON.parse(ingredient_serialized)

## starting code

# Find out ingredient.Class and go from there
#  ingredient['drinks'].first['strIngredient1']
#
# 5.times do |ingredient|
#    ingredient = Ingredient.new(name:  )
#  end
#
#  5.times { |ingredient| ingredient = Ingredient.new(name: ingredient['drinks'].sample['strIngredient1']  )
#  }

#  5.times { |ingredient| puts ingredient['drinks'].sample['strIngredient1'] }

5.times do
  Ingredient.create!(name: ingredient['drinks'].sample['strIngredient1'])
end


10.times do
  cocktail = Cocktail.new(name: Faker::Movies::HarryPotter.spell)
  unless cocktail.save!
    cocktail = Cocktail.new(name: Faker::Movies::HarryPotter.spell)
    cocktail.save!
  end
end

10.times do
  cocktail = Cocktail.new(name: Faker::Movies::HarryPotter.spell)
  cocktail.save!
end
