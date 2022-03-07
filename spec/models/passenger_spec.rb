require 'rails_helper'

RSpec.describe Passenger, type: :model do 
  describe 'relationships' do 
    it {should have_many :flight_passengers}
    it {should have_many(:flights).through(:flight_passengers)}
  end 

  describe 'class methods' do 
    # describe '#return_adults' do 
    #   it 'returns all passengers that are older than 17' do 
    #     FlightPassenger.destroy_all
    #     Passenger.destroy_all
    #     passenger1 = Passenger.create!(name: "Tina", age: 15)
    #     passenger2 = Passenger.create!(name: "Linda", age: 43)
    #     passenger3 = Passenger.create!(name: "Louise", age: 12)
    #     passenger4 = Passenger.create!(name: "Bob", age: 44)

    #     expect(Passenger.return_adults).to eq([passenger2, passenger4])
    #   end 
    # end
    
  end 
end