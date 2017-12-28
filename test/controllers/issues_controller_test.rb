require 'test_helper'

describe IssuesController do
  before do
    @product = products(:duke)
    @issue = issues(:two)
    sign_in customers(:peter)
  end

  describe 'Issue read methods' do
    it 'GET index of all issues' do
      get product_issues_path(@product)
      must_respond_with :success
    end
    it 'GET new review' do
      get new_product_issue_path(@product)
      must_respond_with :success
    end
    it 'GET shows a specific issue' do
      get product_issue_path(@issue.product, @issue)
      must_respond_with :success
    end
    it 'GET edits issue' do
      get edit_product_issue_path(@issue.product, @issue)
      must_respond_with :success
    end
  end
  describe 'Issue write methods' do
    it 'PATCH updates issue' do
      updated_issue = {
          comment: 'Its got worse than it was before!'
      }
      patch product_issue_path(@product, @issue), params: {issue: updated_issue}
      must_redirect_to product_issues_path
    end
    it 'POST creates issue' do
      new_issue = {
          severity: 'minor',
          comment: 'I can not access 5th grade despite fulfilling all requirements'
      }
      expect(lambda do
        post product_issues_path(@product), params: {issue: new_issue}
      end).must_change 'Issue.count'
      must_redirect_to product_issues_path
    end
    it 'DELETE destroys issue' do
      expect(lambda do
        delete product_issue_path(@issue.product, @issue)
      end).must_change('Issue.count', -1)
      must_redirect_to product_issues_path
    end
  end
end