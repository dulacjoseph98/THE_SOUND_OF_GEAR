# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Device.destroy_all
User.destroy_all

guillaume = User.new(name: "Guillaume", password: "123456", email: "guillaume@lewagon.org")
guillaume.save!

gabriel = User.new(name: "Gabriel", password: "123456", email: "gabriel@gmail.com")
gabriel.save!

nasser = User.new(name: "Nasser", password: "123456", email: "nasser@lewagon.org")
nasser.save!



users = [guillaume, gabriel, nasser]

speakers_devices = ["Yamaha HS7", "Focal Twin 6", "Genelec 8030 CP"]
5.times do
  Device.create!(user: users.sample, name: speakers_devices.sample, category: "speakers", location: Faker::Address.full_address)
end

synthetiseur_devices = ["Moog Voyager", "Roland Jupiter X", "Behringer Poly D"]
5.times do
  Device.create!(user: users.sample, name: synthetiseur_devices.sample, category: "synthetiseur", location: Faker::Address.full_address)
end

soundcard_devices = ["Apollo Twin", "Focusrite Scarlett", "Antelop Zen Go"]
5.times do
  Device.create!(user: users.sample, name: soundcard_devices.sample, category: "carte son", location: Faker::Address.full_address)
end

microphone_devices = ["Neumann U87", "Neumann KM184", "Beyer M88 TG"]
5.times do
  Device.create!(user: users.sample, name: microphone_devices.sample, category: "microphone", location: Faker::Address.full_address)
end


