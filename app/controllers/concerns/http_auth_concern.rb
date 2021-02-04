module HttpAuthConcern
  extend ActiveSupport::Concern

  include do
    before_action :http_authenticate
  end

  def http_authenticate
    return true unless rails.env == 'production'

    authenticate_or_request_with_http_basic do |username, password|
      username == 'jungle' && password == 'book'
    end
  end
end
