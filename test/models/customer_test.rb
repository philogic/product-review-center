require 'test_helper'

describe Customer do
  let(:anne) {customers(:anne)}
  let(:peter) {customers(:peter)}
  let(:margaret) {customers(:margaret)}
  let(:paul) {customers(:paul)}
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

  describe 'has reviews' do
    it 'Anne should have one review' do
      expect(anne.reviews.size).must_equal 1
    end

    it 'Margaret should have many reviews' do
      expect(margaret.reviews.size).must_equal 2
    end

    it 'Paul should have no reviews' do
      expect(paul.reviews.size).must_equal 0
    end
  end
end
