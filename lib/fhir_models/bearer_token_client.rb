# TODO: This is nearly the same as BasicAuthClient... Can we make this nicer?
class BearerTokenClient < NoAuthClient
  attr_reader :token

  def initialize(token, http_client: nil)
    super

    @token = token
  end

  private

  def auth_headers
    { 'Authorization' => "Bearer #{token}" }
  end
end
