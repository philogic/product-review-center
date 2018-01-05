class Messaging
  def initialize(api_host)
    @connection = Excon.new(api_host)
    auth_response = @connection.post(path: '/authenticate',
                                     body: {
                                         name: 'product-review-center',
                                         password: '5469secure'
                                     }.to_json,
                                     headers: {
                                         'Content-Type': 'application/json'
                                     })
    if auth_response.status == 200
      @auth_token = JSON.parse(auth_response.body).fetch('auth_token')
    else
      raise 'Authentication failed!'
    end
  end

  def send(msg)
    params = {content: msg[:content], originator: msg[:originator], recipient: msg[:recipient]}
    response = @connection.post(path: '/messages',
                                body: params.to_json,
                                headers: {
                                    'Content-Type': 'application/json',
                                    'Authorization': @auth_token
                                })
    response.status == 201
  end

  def receive(username, status = nil)
    query = {mailbox: username}
    query.merge!({status: status}) if status
    response = @connection.get(path: '/messages',
                               query: query,
                               headers: {
                                   'Authorization': @auth_token
                               })
    response.status == 200
    JSON.parse(response.body)
  end
end