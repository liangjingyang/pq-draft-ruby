# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create!(name: 'test', uid: '123', provider: 'wx')
box = user.box
10.times.each do
  box.posts.create!(content: "This file should contain all the record creation needed to seed the database with its default values.",
                    images: ["aaa", "bbb"])
end