require_relative '../test_helper'
class MessagingTest < Minitest::Test
  API_HOST = 'http://localhost:3020'

  def setup
    @test_originator = 'test_originator'
    @test_recipient = 'test_recipient'

    expected_response = {'auth_token': '2481632'}.to_json

    stub_request(:post, "http://localhost:3020/authenticate").
        with(body: "{\"name\":\"product-review-center\",\"password\":\"5469secure\"}",
             headers: {'Content-Type'=>'application/json', 'Host'=>'localhost:3020', 'User-Agent'=>'excon/0.60.0'}).
        to_return(status: 200, body: expected_response, headers: {})

    @gateway = MiniTest::Mock.new(Messaging.new(API_HOST))
  end

  def test_send
    msg = {content: 'Test message', originator: @test_originator, recipient: @test_recipient }

    @gateway.expect(:send, true, [msg])
    @gateway.send(msg)
    assert_mock @gateway
  end
end