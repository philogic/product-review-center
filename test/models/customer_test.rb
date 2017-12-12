require 'test_helper'

describe Customer do
  let(:anne) {customers(:anne)}
  let(:peter) {customers(:peter)}
  let(:margaret) {customers(:margaret)}
  describe 'validations' do
    it 'is a valid customer' do
      expect(anne).must_be :valid?
    end

    it 'is invalid customer - lack of last name' do
      expect(peter).must_be :invalid?
      expect(peter.errors[:last_name]).must_include "can't be blank"
    end

    it 'is invalid customer - username duplication' do
      expect(margaret).must_be :invalid?
      expect(margaret.errors[:username]).must_include 'has already been taken'
    end
  end
end
