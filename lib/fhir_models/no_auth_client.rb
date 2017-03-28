class NoAuthClient
  attr_accessor :http_client

  def initialize(*_args, http_client: nil)
    @http_client = http_client || RestClient
  end

  def get(url, headers = {})
    http_client.get(url, headers.merge(auth_headers))
  end

  def post(url, body, headers = {})
    http_client.post(url, body, headers.merge(auth_headers))
  end

  def put(url, body, headers = {})
    http_client.put(url, body, headers.merge(auth_headers))
  end

  def patch(url, body, headers = {})
    http_client.patch(url, body, headers.merge(auth_headers))
  end

  def delete(url, headers = {})
    http_client.delete(url, headers.merge(auth_headers))
  end

  def head(url, headers = {})
    http_client.head(url, headers.merge(auth_headers))
  end

  def options(url, headers = {})
    http_client.options(url, headers.merge(auth_headers))
  end

  private

  def auth_headers
    {}
  end
end
