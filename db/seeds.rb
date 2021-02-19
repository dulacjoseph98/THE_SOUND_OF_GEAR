# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

Reservation.destroy_all
Device.destroy_all
User.destroy_all


guillaume = User.new(name: "Guillaume", password: "123456", email: "guillaume@lewagon.org")
guillaume.save!

gabriel = User.new(name: "Gabriel", password: "123456", email: "gabriel@gmail.com")
gabriel.save!

nasser = User.new(name: "Nasser", password: "123456", email: "nasser@lewagon.org")
nasser.save!

john = User.new(name: "John", password: "123456", email: "jlennon@gmail.com")
john.save!


users = [guillaume, gabriel, nasser, john]
city = ["75001", "78125", "92130", "75012", "56250", "56340"]


speakers_devices = [["Yamaha HS7", 20, "https://medias.audiofanzine.com/images/normal/yamaha-hs7-3223795.jpg"],
                    ["Focal Twin 6", 50, "https://res.cloudinary.com/dxr1rv4wx/image/upload/v1613732027/focaltwin_xznwov.jpg"],
                    ["Genelec 8030 CP", 30, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKYx08WFQ2LAAUQEN8gjdGlc_PxfhOhCrAAw&usqp=CAU"]]

speakers_description = "Speaker 6.5 cone woofer (60W) + 1 dome tweeter (35W), 3- and 2-way monitor in one, Balanced 6.3 mm jack input"
3.times do
  speakers = speakers_devices.sample
  file = URI.open(speakers.last)
  speaker_device = Device.create!(user: users.sample, name: speakers.first, price: speakers[1], description: speakers_description, category: "speakers", address: city.sample)
  speaker_device.photo.attach(io: file, filename: 'device.png', content_type: 'image/png')
  speaker_device.save!
end


synthetiseur_devices = [["Moog Voyager", 60, "https://img.audiofanzine.com/images/u/product/normal/moog-music-minimoog-voyager-select-series-161415.jpg"],
                        ["Roland Jupiter X", 45, "https://i2.wp.com/www.gearjunkies.com/wp-content/uploads/2020/01/roland-zen-core-e1579115688887.png?resize=436%2C291"],
                        ["Behringer Poly D", 40, "https://www.acclaim-music.com/product-images/h420/live/images/D/28962_behringer_polyd_BEHRINGER-POLYD-ACCLAIM-DI9.jpg"]]
3.times do
  synth = synthetiseur_devices.sample
  file = URI.open(synth.last)
  synth_device = Device.create!(user: users.sample, name: synth.first, price: synth[1], category: "keyboard", address: city.sample)
  synth_device.photo.attach(io: file, filename: 'device.png', content_type: 'image/png')
  synth_device.save!
end


soundcard_devices = [["Apollo Twin", 40, "https://media.uaudio.com/assetlibrary/a/p/apollo_twin_x_hero.jpg"],
                     ["Focusrite Scarlett", 15, "https://i5.walmartimages.com/asr/af200329-24ee-40f8-9a80-1a04d9098253_1.58c10b2dcc76299c620882da9b7fab79.jpeg"],
                     ["Antelop Zen Go", 30, "https://i0.wp.com/musiccenter.pl/wp-content/uploads/2021/01/DSC00972.jpg?fit=1700%2C957&ssl=1"]]
3.times do
  soundcard = soundcard_devices.sample
  file = URI.open(soundcard.last)
  soundcard_device = Device.create!(user: users.sample, name: soundcard.first, price: soundcard[1], category: "soundcard", address: city.sample)
  soundcard_device.photo.attach(io: file, filename: 'device.png', content_type: 'image/png')
  soundcard_device.save!
end


microphone_devices = [["Neumann U87", 30, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRX2UvbNeH2TH3VrMOs8wBdP1TEJlrN-L5oQ&usqp=CAU"],
                      ["Neumann KM184", 20, "https://funkyjunkfrance.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/n/e/neumann-km-184-mt.jpg"],
                      ["Beyer M88 TG", 10, "https://cdn.brianli.com/uploads/2020/04/20200404_BEYERDYNAMIC-M88.jpg"]]

microphone_description = "The U 87 is equipped with a large dual-diaphragm capsule, Three directional patterns: omnidirectional, Cardioid and figure-8, These are selectable with a switch below the headgrille"

3.times do
  micro = microphone_devices.sample
  file = URI.open(micro.last)
  micro_device = Device.create!(user: users.sample, name: micro.first, price: micro[1], description: microphone_description, category: "microphone", address: city.sample)
  micro_device.photo.attach(io: file, filename: 'device.png', content_type: 'image/png')
  micro_device.save!
end


