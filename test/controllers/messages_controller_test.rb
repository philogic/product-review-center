require "test_helper"

describe MessagesController do
  it "should get index" do
    get messages_index_url
    value(response).must_be :success?
  end

  it "should get create" do
    get messages_create_url
    value(response).must_be :success?
  end

  it "should get show" do
    get messages_show_url
    value(response).must_be :success?
  end

end
