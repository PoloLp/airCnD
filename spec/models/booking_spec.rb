require 'rails_helper'

x = Time.now

RSpec.describe "Booking", :type => :model do
  let(:user) do
    User.create!({
      email: "jean.thug@grosmail.fr",
      username: "Freluquet",
      password: "123456"
    })
  end
  let(:desk) do
    Desk.create!({
      price: "10",
      title: "Le bureau du fanfreluche",
      description: "Mais quel bureau magnifique",
      user_id: user.id
      # address: "15 rue de la pompe, 75003 Paris",
    })
  end
  let(:valid_attributes) do
    {
      start_at: x,
      end_at: (x + 100),
      review: 'Such a delightful moment',
      rating: 5,
      desk_id: desk.id,
      user_id: user.id
    }
  end

  it "has a review" do
    booking = Booking.new(review: "This is a great desk")
    expect(booking.review).to eq("This is a great desk")
  end

  it "has a rating (stored as float)" do
    booking = Booking.new(rating: 4.5)
    expect(booking.rating).to eq(4.5)
  end

  it "Start_at cannot be blank" do
    attributes = valid_attributes
    attributes.delete(:start_at)
    booking = Booking.new(attributes)
    expect(booking).not_to be_valid
  end

  it "Start_at format should be datetime" do
    attributes = valid_attributes
    booking = Booking.new(attributes)
    expect(booking.start_at).to eq(x)
  end

  it "End_at cannot be blank" do
    attributes = valid_attributes
    attributes.delete(:end_at)
    booking = Booking.new(attributes)
    expect(booking).not_to be_valid
  end

  it "End_at format should be datetime" do
    attributes = valid_attributes
    booking = Booking.new(attributes)
    expect(booking.end_at).to eq(x + 100)
  end

  it "parent desk cannot be nil" do
    attributes = valid_attributes
    attributes.delete(:desk_id)
    booking = Booking.new(attributes)
    expect(booking).not_to be_valid
  end

  it "rating should be a number between 0 and 5" do
    attributes = valid_attributes
    (0..5).each do |rating|
      attributes[:rating] = rating
      booking = Booking.new(attributes)
      expect(booking).to be_valid
    end

    expect(Booking.new(attributes.merge(rating: -1))).not_to be_valid
    expect(Booking.new(attributes.merge(rating: 6))).not_to be_valid
  end
end
