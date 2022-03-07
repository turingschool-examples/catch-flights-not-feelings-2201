require 'rails_helper'

RSpec.describe Passenger, type: :model do
  it { should have_many :flight_passengers }
  it { should have_many(:flights).through(:flight_passengers) }


  it "should return adult passengers(older than or equal to 18) once" do

    passenger = Passenger.create!(name: "Zerg", age: 32)
    passenger2 = Passenger.create!(name: "Tina", age: 34)
    passenger3 = Passenger.create!(name: "Little Tina", age: 9)


    passenger4 = Passenger.create!(name: "Terran", age: 32)
    passenger5 = Passenger.create!(name: "Bob", age: 36)
    passenger6 = Passenger.create!(name: "Little Bob", age: 8)

    expect(Passenger.adult).to eq([passenger,passenger2,passenger4,passenger5])
  end
end
