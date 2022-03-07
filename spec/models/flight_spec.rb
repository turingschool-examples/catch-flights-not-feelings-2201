require 'rails_helper'

RSpec.describe Flight, type: :model do
  it { should belong_to :airline }
  it { should have_many :passenger_flights }
  it { should have_many(:passengers).through(:passenger_flights) }
  describe 'instance methods' do 
    before :each do 
        @united = Airline.create!(name: 'United')
        @flight_1 = Flight.create!(number: 1, date: '01-02-2000', departure_city: 'Houston', arrival_city: 'Los Angeles', airline: @united)
        @passenger_1 = Passenger.create!(name: 'bob', age: 7)
    end
    it 'should add a passenger' do 
      expect(@flight_1.passengers).to be_empty
      @flight_1.add_passenger(@passenger_1)
      expect(@flight_1.passengers).to eq([@passenger_1])
    end
    it 'should remove a passenger' do 
      @flight_1.add_passenger(@passenger_1)
      expect(@flight_1.passengers).to eq([@passenger_1])
      @flight_1.remove_passenger(@passenger_1)
      expect(@flight_1.passengers).to be_empty
    end
  end

end