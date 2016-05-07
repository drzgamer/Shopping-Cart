# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Item.create(name: "Wine", price: 12.99, quantity: 10)
Item.create(name: "Beer", price: 2.99, quantity: 10)
Item.create(name: "Chicken", price: 3.99, quantity: 10)
Item.create(name: "Steak", price: 4.99, quantity: 10)