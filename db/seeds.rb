# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# if ferrets == 0 
#     Ferret.create(name: "hobbet", age: 2, disposition: "great boy", user_id: 6)
#     Ferret.create(name: "hobb", age: 3, disposition: "ok boy", user_id: 6)
#     Ferret.create(name: "hobbet", age: 2, disposition: "great boy", user_id: 6)
#     Ferret.create(name: "hobbet", age: 2, disposition: "great boy", user_id: 6)
#     Ferret.create(name: "hobbet", age: 2, disposition: "great boy", user_id: 6)
# end dont know how to seed activestorage pictures...

    Category.create(id: 1, title: "toys")
    Category.create(id: 2, title: "beds")
    Category.create(id: 3, title: "food")


    Item.create(id: 1, title: "toy", content: "toy", price: 13, user_id: 1, category_id: 1)
    Item.create(id: 2, title: "bed", content: "bed", price: 11, user_id: 1, category_id: 2)
    Item.create(id: 3, title: "food", content: "food", price: 15, user_id: 1, category_id: 3)
