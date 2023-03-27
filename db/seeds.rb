require 'open-uri'
require 'json'
require 'faker'
require "nokogiri"

puts "=================="
puts "Resetting DB..."
puts "=================="
User.destroy_all
puts "Users deleted!"
Recipe.destroy_all
puts "Recipes deleted!"
Post.destroy_all
puts "Posts deleted!"
puts "------------------"
puts "DB Reset!"

puts ""

puts "=================="
puts "Creating users...."
puts "=================="

puts ""

10.times do
  first = Faker::Name.first_name
  last = Faker::Name.last_name
  User.create(
    first_name: first,
    last_name: last,
    email: "#{first}.#{last}@savage.com",
    password: "123456"
  )
end

# ---admin creation---
puts "Creating admin..."
User.create(
  first_name: "Joel",
  last_name: "Savage",
  password: "patt123",
  email: "js@savages.com"
)
puts "Admin #{User.last.first_name} created!"
# ---admin creation---

puts ""

puts "=================="
puts "#{User.all.length} Users created!"
puts "=================="

puts ""

puts "=================="
puts "Creating Recipes..."
puts "=================="

# --- NOKIGIRI SEED FOR RECIPES ---

# food_item = Faker::Dessert.variety
# food_url = "https://www.allrecipes.com/search?q=#{food_item}"
# results = []
# html_file = URI.open(food_url).read
# html_doc = Nokogiri::HTML.parse(html_file)

# html_doc.search(".mntl-card-list-items").take(5).each do |element|
#   name = element.search(".card__title-text").text.strip
#   recipe_description = get_desc(element)
#   results << [name, recipe_description]
# end

# results.each do |recipe|
#   recipe = Recipe.new(title: recipe[0], content: recipe[1])
#   recipe.user = User.all.sample
#   recipe.save
# end

# --- NOKIGIRI SEED FOR RECIPES ---

5.times do
  recipe = Recipe.new(title: Faker::Dessert.variety, content: Faker::Dessert.flavor)
  recipe.user = User.all.sample
  recipe.save
end

puts "=================="
puts "#{Recipe.all.length} Recipes created!"
puts "=================="

puts ""

puts "=================="
puts "Creating posts..."
puts "=================="

puts ""

5.times do
  user = User.all.sample
  Post.create(user: user, title: "This is a food post", content: "
    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not
    only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker
    including versions of Lorem Ipsum.")
end

puts "=================="
puts "#{Post.all.length} Posts created!"
puts "=================="

puts ""

puts "Users count: #{User.all.length}"
puts "Posts count: #{Post.all.length}"
puts "Recipes count: #{Recipe.all.length}"

puts ""

puts "Seeding DB completed!"
