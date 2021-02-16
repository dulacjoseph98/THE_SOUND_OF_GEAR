# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Device.destroy_all
User.destroy_all

guillaume = User.new(name: "Guillaume", password: "123456", email: "guillaume@lewagon.org")
guillaume.save!

gabriel = User.new(name: "Gabriel", password: "123456", email: "gabriel@gmail.com")
gabriel.save!

nasser = User.new(name: "Nasser", password: "123456", email: "nasser@lewagon.org")
nasser.save!


apollo = Device.new(name: "Apollo Twin", category: "carte son", location: "Paris", user: guillaume)
apollo.save!

neumann = Device.new(name: "U87", category: "microphone", location: "Paris", user: gabriel)
neumann.save!

moog = Device.new(name: "Moog Voyager", category: "synthétiseur", location: "Marseille", user: nasser)
moog.save!
