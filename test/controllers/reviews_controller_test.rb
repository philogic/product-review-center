require 'test_helper'

describe ReviewsController do
  before do
    @product = products(:monopoly)
    @review = reviews(:five)
    sign_in customers(:margaret)
  end

  describe 'Review read methods' do
    it 'GET index of all reviews' do
      get product_reviews_path(@product)
      must_respond_with :success
    end

    it 'GET new review' do
      get new_product_review_path(@product)
      must_respond_with :success
    end

    it 'GET shows a specific review' do
      get product_review_path(@review.product, @review)
      must_respond_with :success
    end

    it 'GET edits review' do
      get edit_product_review_path(@review.product, @review)
      must_respond_with :success
    end
  end

  describe 'Review write methods' do
    it 'PATCH updates review' do
      updated_review = {
          comment: 'The comment has changed'
      }
      patch product_review_path(@product, @review), params: {review: updated_review}
      must_redirect_to product_reviews_path
    end

    it 'POST creates review' do
      new_review = {
          rating: 1,
          comment: 'Worst game ever played!'
      }
      expect(lambda do
        post product_reviews_path(@product), params: {review: new_review}
      end).must_change 'Review.count'
      must_redirect_to product_reviews_path
    end

    it 'DELETE destroys review' do
      expect(lambda do
        delete product_review_path(@review.product, @review)
      end).must_change('Review.count', -1)
      must_redirect_to product_reviews_path
    end
  end
end