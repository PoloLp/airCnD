require 'rails_helper'

RSpec.describe "Desk", :type => :model do
  let(:valid_attributes) do
    {
      price: "10",
      title: "Le bureau du fanfreluche",
      description: "Mais quel bureau magnifique",
      address: "15 rue de la pompe, 75003 Paris",
    }
  end

  it "has a title" do
    desk = Desk.new(title: "Le bureau du fanfreluche")
    expect(desk.title).to eq("Le bureau du fanfreluche")
  end

  it "has an address" do
    desk = Desk.new(address: "15 rue de la pompe, 75003 Paris")
    expect(desk.address).to eq("15 rue de la pompe, 75003 Paris")
  end

  it "has a description" do
    desk = Desk.new(description: "Mais quel bureau magnifique")
    expect(desk.description).to eq("Mais quel bureau magnifique")
  end

  it "has a price" do
    desk = Desk.new(price: "10")
    expect(desk.price).to eq("10")
  end

  it "title cannot be blank" do
    attributes = valid_attributes
    attributes.delete(:title)
    desk = Desk.new(attributes)
    expect(desk).not_to be_valid
  end

  it "address cannot be blank" do
    attributes = valid_attributes
    attributes.delete(:address)
    desk = Desk.new(attributes)
    expect(desk).not_to be_valid
  end

  it "price cannot be blank" do
    attributes = valid_attributes
    attributes.delete(:price)
    desk = Desk.new(attributes)
    expect(desk).not_to be_valid
  end

  it "has many bookings" do
    desk = Desk.new(valid_attributes)
    expect(desk).to respond_to(:bookinks)
  end

  # it "should destroy child reviews when destroying self" do
  #   desk = Desk.create!(valid_attributes)
  #   3.times { desk.reviews.create! content: "great!", rating: 5 }
  #   expect { desk.destroy }.to change { Review.count }.from(3).to(0)
  # end
end
