# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
mateo = User.create(first_name: 'Mateo', last_name: 'Lazo', email: 'mateo@email.com', password: 'passm1', login_status: 'good')
julian = User.create(first_name: 'Julian', last_name: 'Jones', email: 'julian@email.com', password: 'passj1', login_status: 'good')
freida = User.create(first_name: 'Freida', last_name: 'Gray', email: 'freida@email.com', password: 'passf1', login_status: 'good')
brad = User.create(first_name: 'Brad', last_name: 'Pitt', email: 'brad@email.com', password: 'passb1', login_status: 'good')
shia = User.create(first_name: 'Shia', last_name: 'Labeouf', email: 'shia@email.com', password: 'passs1', login_status: 'good')