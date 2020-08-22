# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# seed Ingredients
require 'json'
require 'open-uri'

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_serialized = open(url).read
ingredient = JSON.parse(ingredient_serialized)

# 30.times do
#   Ingredient.create!(name: ingredient['drinks'].sample['strIngredient1'])
# end

for i in 1..29
  Ingredient.create!(name: ingredient['drinks'][i]['strIngredient1'])
end

# old method
# 5.times do
#   Ingredient.create!(name: ingredient['drinks'].sample['strIngredient1'])
# end

#Cocktails
# spells = []

# 30.times do
#   spells << Faker::Movies::HarryPotter.spell
# end
# spells = spells.uniq

# for spell in spells
#   cocktail = Cocktail.create!(name: spell)
# end
