require 'rails_helper'

RSpec.describe Passenger, type: :model do
  describe 'relationships' do
    it { should belong_to :airline }
    it { should have_many :passengers }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:age) }
    it { should validate_presence_of(:flight_id) }
  end
end
