require 'rails_helper'

RSpec.describe Passenger, type: :model do
  it { should have_many :flights }
  it { should have_many :passenger_flights }
  it { should validate_presence_of :name}
  it { should validate_presence_of :age}
end
