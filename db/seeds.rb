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
Category.destroy_all
puts "Categories deleted!"
puts "------------------"

puts ""

puts "Users count: #{User.all.length}"
puts "Posts count: #{Post.all.length}"
puts "Recipes count: #{Recipe.all.length}"
puts "Categories count: #{Category.all.length}"

puts ""

puts "DB Reset!"

puts ""

puts "=================="
puts "Creating users...."
puts "=================="

puts ""

user_bio = [
  "is a food scientist who works to develop new and innovative food products that are both healthy and delicious.",
  "is a pastry chef who has a passion for creating beautiful and delicious desserts that delight the senses.",
  "is a home cook who takes pride in creating delicious meals for her family and friends, using fresh and locally-sourced ingredients whenever possible.",
  "is a nutritionist who is passionate about healthy eating and helping others improve their diets through mindful food choices.",
  "is a professional chef who has dedicated his life to creating delicious and innovative dishes that showcase his love of food."
]

10.times do
  first = Faker::Name.first_name
  last = Faker::Name.last_name
  User.create(
    first_name: first,
    last_name: last,
    email: "#{first}.#{last}@savage.com",
    password: "123456",
    bio: "#{first} " + user_bio.sample
  )
end

# ---admin creation---
puts "Creating admin..."
User.create(
  first_name: "Joel",
  last_name: "Savage",
  password: "patt123",
  email: "js@savages.com",
  bio: "Joel is a pastry chef who has a passion for creating beautiful and delicious desserts that delight the senses.",
  admin: true
)
puts "Admin #{User.last.first_name} created!"
# ---admin creation---

puts ""

puts "=================="
puts "#{User.all.length} Users created!"
puts "=================="

puts ""

puts "=================="
puts "Creating Categories..."
puts "=================="

categories = ["Breakfast", "Lunch", "Dinner", "Dessert", "Snacks"]
categories.each do |category|
  Category.create(title: category)
end

puts "=================="
puts "Created Categories!"
puts "=================="

puts ""

puts "=================="
puts "Creating Recipes..."
puts "=================="

user_descs = [
  "This recipe is a classic comfort food that's perfect for a cozy night in. It's a hearty and filling dish that's sure to satisfy your cravings.",
  "If you're looking for a quick and easy meal that's packed with flavor, then this recipe is for you. It's a simple yet delicious dish that you can whip up in no time.",
  "This recipe is a great way to switch up your usual meal routine. It's a unique combination of ingredients that come together to create a delicious and satisfying dish.",
  "If you're a fan of bold and spicy flavors, then you'll love this recipe. It's a fiery dish that's not for the faint of heart, but it's sure to leave your taste buds buzzing.",
  "This recipe is a healthier take on a classic dish, without sacrificing any flavor. It's a guilt-free meal that you can feel good about indulging in."
]
# recipe_desc = "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia"
recipe_conts = [
  "In a large bowl, combine all of the ingredients and mix well. Pour the mixture into a greased baking dish and bake in the oven until golden brown and crispy.",
  "Heat a large skillet over medium-high heat and add the ingredients to the pan. Cook for a few minutes, stirring occasionally, until everything is cooked through and tender.",
  "Bring a pot of salted water to a boil and add the ingredients to the pot. Cook until tender, then drain the water and return the ingredients to the pot. Add any additional seasonings or sauces and stir well.",
  "Preheat the grill to medium-high heat and place the ingredients on the grates. Grill for a few minutes on each side, until charred and cooked to your desired level of doneness.",
  "Heat a large wok over high heat and add the ingredients to the pan. Stir-fry for a few minutes, until everything is cooked through and tender. Serve hot with rice or noodles."
]

ing_lists = [
  "Flour, sugar, eggs, butter, baking powder, milk, vanilla extract, salt",
  "Chicken breasts, bell peppers, onions, garlic, cumin, chili powder, oregano, salt, pepper, olive oil",
  "Pasta, canned tomatoes, garlic, onion, basil, olive oil, salt, pepper, parmesan cheese",
  "Ground beef, kidney beans, canned tomatoes, onions, garlic, chili powder, cumin, paprika, salt, pepper",
  "Salmon fillets, asparagus, lemon, olive oil, garlic, salt, pepper, dill"
]

8.times do
  recipe = Recipe.new(
    title: Faker::Dessert.variety + " " + Faker::Dessert.variety,
    user_desc: user_descs.sample,
    content: recipe_conts.sample,
    difficulty: (0..5).to_a.sample,
    ingredients: ing_lists.sample
  )

  recipe.user = User.all.sample
  recipe.category = Category.all.sample
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

post_titles = [
  "Brunch Goals: Delicious Avocado Toast",
  "Tasty Tuesday: Creamy Mushroom Risotto",
  "Spice Up Your Life: Flavorful Curry Chicken",
  "Meatless Monday: Veggie-packed Stir Fry",
  "Dessert Heaven: Decadent Chocolate Cake"
]

post_conts = [
  "Today's breakfast was a delicious stack of pancakes topped with fresh berries and maple syrup. There's nothing quite
  like starting the day with a sweet and satisfying meal like this. What's your go-to breakfast dish?",

  "Dinner tonight was a mouthwatering plate of homemade lasagna. Layer upon layer of rich tomato sauce, melted cheese,
  and perfectly cooked noodles - it's a classic dish that never disappoints. What's your favorite comfort food?",

  "Snack time! These peanut butter energy balls are the perfect pick-me-up when you need a little boost of energy.
  They're packed with protein and flavor, and they're so easy to make. What's your favorite healthy snack?",

  "I love experimenting with new flavor combinations, and this dish is no exception. It's a fusion of Mexican and Asian
  flavors, with juicy chicken, bell peppers, and onions cooked in a sweet and spicy sauce. What's the most unique dish you've ever tried?",

  "Nothing beats a warm bowl of soup on a chilly day. This creamy tomato soup is the ultimate comfort food, and it's so easy to make.
  All you need are a few simple ingredients and you're on your way to a cozy and satisfying meal. What's your favorite soup recipe?"
]

7.times do
  user = User.all.sample
  title_rand = post_titles.sample
  cont_rand = post_conts.sample
  Post.create(
    user: user,
    title: title_rand,
    content: cont_rand
  )
end

puts "=================="
puts "#{Post.all.length} Posts created!"
puts "=================="

puts ""

puts "=================="
puts "Creating Chatrooms..."
puts "=================="

puts ""
Chatroom.create(name: 'General')
Chatroom.create(name: 'About')
Chatroom.create(name: 'Help')

puts "=================="
puts "Created Chatrooms!"
puts "=================="

puts ""

puts "=================="
puts "Creating Locations..."
puts "=================="

puts ""

puts "=================="
puts "Created Locations!"
puts "=================="

puts ""

puts "Users count: #{User.all.length}"
puts "Posts count: #{Post.all.length}"
puts "Recipes count: #{Recipe.all.length}"
puts "Categories count: #{Category.all.length}"
puts "Chatrooms count: #{Chatroom.all.length}"

puts ""

puts "Seeding DB completed!"
