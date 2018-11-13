# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'faker'

Time.zone = 'Paris'

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
    desk = Desk.new(
                    title: Faker::Movies::StarWars.planet,
                    description: Faker::TvShows::GameOfThrones.quote,
                    price: rand(1..30).to_f,
                    address: Faker::TvShows::Simpsons.location,
                    user_id: user.id
                    )
    desk.save!
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
