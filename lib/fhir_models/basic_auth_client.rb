# TODO: This is nearly the same as BearerTokenClient... Can we make this nicer?
class BasicAuthClient < NoAuthClient
  attr_reader :username, :password

  def initialize(username, password, http_client: nil)
    super

    @username = username
    @password = password
  end

  private

  def auth_headers
    { 'Authorization' => "Basic #{token}" }
  end

  def token
    @token ||= Base64.strict_encode64("#{username}:#{password}")
  end
end
