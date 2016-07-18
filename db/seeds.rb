# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.create(first_name: "Erik John", last_name: "Alicaya", login_status: "online", password: "12345", email: "erik.alicaya@chromedia.com")
Store.create(name: "Manang Lisa's Hardware", contact: "422-8967", location: "Gorordo Ave., Lahug, Cebu City", category: "Hardware", store_hours: "8am-8pm",
             average_sales: 2000.00, description: "A very beautiful and peaceful store.", website: "www.Lisa.com",
             facebook_page: "www.facebook.com/lisalicious", twitter_page: "www.twitter.com/lisalicious", user_id: u1.id)
Store.create(name: "Babbadookdook Store", contact: "123-4567", location: "Unknown Secret, Cebu City", category: "Departmental Store", store_hours: "24/7",
             average_sales: 50000.00, description: "When you knock knock comes the babba dook dook dook dook", website: "www.Babbadook.com",
             facebook_page: "www.facebook.com/CreepyPasta", twitter_page: "www.twitter.com/CreepyPasta", user_id: u1.id)
Store.create(name: "Winx", contact: "(032) 422 8962", location: "Kamputhaw, Cebu City", category: "Food Store", store_hours: "7am-10pm",
             average_sales: 10000.00, description: "Chicken Hotdog is the best seller here!", website: "www.Winx.com",
             facebook_page: "www.facebook.com/Winx", twitter_page: "www.twitter.com/Winx", user_id: u1.id)

u2 = User.create(first_name: "Stephen", last_name: "Curry", login_status: "offline", password: "54321", email: "stephen.curry@gmail.com")
Store.create(name: "Joweldon", contact: "417-1234/09983455432", location: "Brgy. Kamputhaw, Cebu City", category: "Food", store_hours: "7am-9pm",
             average_sales: 5000.00, description: "A comfortable place to eat and buy foods.", website: "www.Joweldon.com",
             facebook_page: "www.facebook.com/joweldon", twitter_page: "n/a", user_id: u2.id)

u3 = User.create(first_name: "Klay", last_name: "Thompson", login_status: "busy", password: "13579", email: "klay_thompson@up.edu.ph")
Store.create(name: "Erik and John (E&J)", contact: "09975345445", location: "SM seaside, Cebu City", category: "Clothes/Footwear", store_hours: "7am-9pm",
             average_sales: 5000.00, description: "Owned by a very gwapo Erik John T. Alicaya", website: "www.E&J.com",
             facebook_page: "www.facebook.com/E&J", twitter_page: "www.twitter.com/E&J", user_id: u3.id)
Store.create(name: "Destiny Store", contact: "09971234567", location: "Destiny Hub, Salinas Drive, Lahug, Cebu City", category: "Book Store",
             store_hours: "8am-9pm", average_sales: 2000.00, description: "Jeremiah 29:11", website: "www.DestinyChurch.com",
             facebook_page: "www.facebook.com/DestinyChurchCebu", twitter_page: "n/a", user_id: u3.id)