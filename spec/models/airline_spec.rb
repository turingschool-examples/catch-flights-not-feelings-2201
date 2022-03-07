require 'rails_helper'

RSpec.describe Airline, type: :model do
  it { should have_many :flights }
  it { should have_many :passengers}

  it { should validate_presence_of :name}
end
