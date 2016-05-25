Rails.application.routes.draw do

  get 'xeroizer' => 'xeroizer#index'
  get 'xero_gateway' => 'xero_gateway#index'
end
