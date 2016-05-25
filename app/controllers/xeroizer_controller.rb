class XeroizerController < ApplicationController
  expose(:client) { Xeroizer::PrivateApplication.new(
      Rails.application.secrets.xero_consumer_key,
      Rails.application.secrets.xero_consumer_secret,
      Rails.root.join(Rails.application.secrets.cert_path),
      rate_limit_sleep: 2,
  )}

  def index
    @contacts = client.Contact.all(:order => 'Name')
  end
end
