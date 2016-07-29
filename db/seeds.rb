# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# mateo = User.create(first_name: 'Mateo', last_name: 'Lazo', email: 'mateo@email.com', password: 'passm1', login_status: 'good')
# Store.create(name: "Manang Lisa's Hardware", contact: "422-8967", location: "Gorordo Ave., Lahug, Cebu City", category: "Hardware", store_hours: "8am-8pm",
#              average_sales: 2000.00, description: "A very beautiful and peaceful store.", website: "www.Lisa.com",
#              facebook_page: "www.facebook.com/lisalicious", twitter_page: "www.twitter.com/lisalicious", user_id: mateo.id)
# Store.create(name: "Babbadookdook Store", contact: "123-4567", location: "Unknown Secret, Cebu City", category: "Departmental Store", store_hours: "24/7",
#              average_sales: 50000.00, description: "When you knock knock comes the babba dook dook dook dook", website: "www.Babbadook.com",
#              facebook_page: "www.facebook.com/CreepyPasta", twitter_page: "www.twitter.com/CreepyPasta", user_id: mateo.id)
# Store.create(name: "Winx", contact: "(032) 422 8962", location: "Kamputhaw, Cebu City", category: "Food Store", store_hours: "7am-10pm",
#              average_sales: 10000.00, description: "Chicken Hotdog is the best seller here!", website: "www.Winx.com",
#              facebook_page: "www.facebook.com/Winx", twitter_page: "www.twitter.com/Winx", user_id: mateo.id)
# julian = User.create(first_name: 'Julian', last_name: 'Jones', email: 'julian@email.com', password: 'passj1', login_status: 'good')
# freida = User.create(first_name: 'Freida', last_name: 'Gray', email: 'freida@email.com', password: 'passf1', login_status: 'good')
# brad = User.create(first_name: 'Brad', last_name: 'Pitt', email: 'brad@email.com', password: 'passb1', login_status: 'good')
# shia = User.create(first_name: 'Shia', last_name: 'Labeouf', email: 'shia@email.com', password: 'passs1', login_status: 'good')

ProductType.create(category: 'Tools')
ProductType.create(category: 'Computer')
ProductType.create(category: 'Mobile')
ProductType.create(category: 'Furniture')
ProductType.create(category: 'Electronics')
ProductType.create(category: 'Shoes')
ProductType.create(category: 'Bags')
ProductType.create(category: 'Clothes')
ProductType.create(category: 'Kitchenware')
ProductType.create(category: 'Office Supplies')
ProductType.create(category: 'Food')

variant_list = [
    [ 'Material', 'Wood, Metal, Plastic' ],
    [ 'Color', 'Black, White' ],
    [ 'Size', 'Small, Medium, Large']
]

variant_list.each do |name, value, store_id|
  Variant.create( name: name, value: value, store_product_id: store_id )
end
