require 'test_helper'

describe HomeController do
  before do
    sign_in customers(:anne)
  end

  describe "GET index" do
    it "responds with :success to authorized user" do
      get root_path
      must_respond_with :success
    end

    it "redirects unauthorized user" do
      sign_out customers(:anne)
      get root_path
      must_redirect_to new_customer_session_url
    end
  end
end
