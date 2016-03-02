# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Post.create(title: "DBC", content: "is great", author_id: 1)
Post.create(title: "Friday", content: "is the best day", author_id: 2)
User.create(username: "mira", password: "pass")
User.create(username: "dbc", password: "password")