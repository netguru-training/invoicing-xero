class XeroGatewayController < ApplicationController
  expose(:client) { XeroGateway::PrivateApp.new(
    Rails.application.secrets.xero_consumer_key,
    Rails.application.secrets.xero_consumer_secret,
    Rails.root.join(Rails.application.secrets.cert_path)
  )}

  def index
    @response = client.get_contacts(:type => :all, :sort => :name, :direction => :desc)
    @contacts = @response.contacts if @response.success?
  end

end
