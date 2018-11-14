# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'faker'

Time.zone = 'Paris'

URL_LIST = [
  "https://images.unsplash.com/photo-1498409785966-ab341407de6e?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8a87674644cd4f622df5c57facbccf1e&auto=format&fit=crop&w=1360&q=80",
  "https://images.unsplash.com/photo-1515965885361-f1e0095517ea?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=1784b1578fa6ead4ed29e0f402ca9d32&auto=format&fit=crop&w=1350&q=80",
  "https://images.unsplash.com/photo-1533721989922-7fbb0a3cb7d4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=662897cc88d02add74c7203703bb6a60&auto=format&fit=crop&w=1350&q=80",
  "https://images.unsplash.com/photo-1522827489705-0616731a52a8?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=bc3136a9d7f722e99966b0559414aee7&auto=format&fit=crop&w=1277&q=81",
  "https://images.unsplash.com/photo-1506188232657-23c9c893ac2b?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=3c82f2eae00a24e9edf641a0ea408ab0&auto=format&fit=crop&w=1350&q=80",
  "https://images.unsplash.com/photo-1492724441997-5dc865305da7?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=3ecc13b203d60ff0fa05b07805b0f2ca&auto=format&fit=crop&w=1350&q=80",
  "https://images.unsplash.com/photo-1486433721740-19c1cabac7ad?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=e5263a94d18da99d9b208624b6526663&auto=format&fit=crop&w=1901&q=80",
  "https://images.unsplash.com/photo-1504261473209-7ccd7f92b205?ixlib=rb-0.3.5&s=184d815f523d9fddef5484dabd39a2a0&auto=format&fit=crop&w=1352&q=80",
  "https://images.pexels.com/photos/777001/pexels-photo-777001.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
  "https://images.unsplash.com/photo-1510519138101-570d1dca3d66?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=45fbe9046945ce711c299b8c6d26d998&auto=format&fit=crop&w=1331&q=80",
  "https://images.unsplash.com/photo-1506935412676-6fa7f9de5bda?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=dee36e7396dbb95d7b49cc5d997777d7&auto=format&fit=crop&w=1350&q=80",
  "https://images.unsplash.com/photo-1498409785966-ab341407de6e?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8a87674644cd4f622df5c57facbccf1e&auto=format&fit=crop&w=1360&q=80",
  "https://images.unsplash.com/photo-1503332628839-f788a9eedc84?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=321337839e3629a762c37f81bbab4fb4&auto=format&fit=crop&w=500&q=60",
  "https://images.pexels.com/photos/821357/pexels-photo-821357.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
  "https://images.pexels.com/photos/380769/pexels-photo-380769.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
  "https://cdn.pixabay.com/photo/2015/04/20/06/46/office-730681_960_720.jpg",
  "https://cdn.pixabay.com/photo/2015/12/05/23/16/office-1078869_960_720.jpg",
  "https://cdn.pixabay.com/photo/2017/10/01/00/52/architecture-2804083_960_720.jpg",
  "https://cdn.pixabay.com/photo/2015/06/24/15/59/workspace-820315_960_720.jpg",
  "https://images.unsplash.com/photo-1496664444929-8c75efb9546f?ixlib=rb-0.3.5&s=6d9c690f637e6c5ca0cdaec52d6af17c&auto=format&fit=crop&w=1350&q=80",
  "https://images.unsplash.com/photo-1497215728101-856f4ea42174?ixlib=rb-0.3.5&s=bd9230e81f1b5c18ba6acdff55f3d8d4&auto=format&fit=crop&w=1350&q=80",
  "https://images.pexels.com/photos/164437/pexels-photo-164437.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
  "https://images.unsplash.com/photo-1510074377623-8cf13fb86c08?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=0a38661364c1153b472b3ec80114c3cf&auto=format&fit=crop&w=1352&q=80"
]

x_desk = 0

Booking.destroy_all
User.destroy_all
Desk.destroy_all

puts '*' * 20
puts 'Creating 5 fake users...'
5.times do
  user = User.new(
    username: Faker::Movies::StarWars.character,
    email: Faker::Internet.email,
    created_at: Time.current,
    password: "123456"
  )
  user.save!
end
puts '5 fake users created'
puts '*' * 20
puts 'Creating random desk for users...'
User.all.each do |user|
  rand(1..6).to_i.times do
    picked_url = URL_LIST[x_desk]
    desk = Desk.new(
                    title: Faker::Movies::StarWars.planet,
                    description: Faker::TvShows::GameOfThrones.quote,
                    price: rand(1..30).to_f,
                    address: Faker::TvShows::Simpsons.location,
                    user_id: user.id
                    )
    desk.remote_photo_url = picked_url
    desk.save!
    x_desk < 22 ? x_desk += 1 : x_desk = 0
  end
end
puts 'Random desk for users created'
puts '*' * 20

puts 'Creating random bookings...'
xtime = Time.current

20.times do
  id_user = rand(1..5).to_i
  id_desk = Desk.all.sample.id
  booking = Booking.new(
                        user_id: id_user,
                        desk_id: id_desk,
                        start_at: xtime,
                        end_at: (xtime + 1000),
                        review: Faker::Movies::StarWars.quote,
                        rating: rand(1..5).to_i,
                        )
  booking.save!
xtime = xtime + 1000
end

puts 'Random bookings created'
puts '*' * 20
