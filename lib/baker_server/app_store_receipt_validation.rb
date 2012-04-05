require 'uri'
require 'net/http'
require 'net/https'
require 'base64'

module BakerServer

  class AppStoreReceiptValidation

    def self.validate_non_consumable(receipt, sandbox = true)
      validate(receipt, false, sandbox)
    end

    def self.validate_subscription(receipt, sandbox = true)
      validate(receipt, true, sandbox)
    end

    def self.validate(receipt, subscription = false, sandbox = true)
      app_store_url = URI.parse(sandbox ? "https://sandbox.itunes.apple.com/verifyReceipt" : "https://buy.itunes.apple.com/verifyReceipt")
      query_params  = {'receipt-data' => Base64.encode64(receipt)}
      query_params.merge!({'password' => '3a10d2824b6e43099ae9c6b955e890ed'}) if subscription
      request                 = Net::HTTP.new(app_store_url.host, app_store_url.port)
      request.use_ssl         = true
      request.verify_mode     = OpenSSL::SSL::VERIFY_NONE
      response, response_body = request.post(app_store_url.path, query_params.to_json.to_s, {'Content-Type' => 'application/x-www-form-urlencoded'})
      if response.code == '200'
        response_body
      end
    end
  end

end

#App Store error responses
#21000 The App Store could not read the JSON object you provided.
#21002 The data in the receipt-data property was malformed.
#21003 The receipt could not be authenticated.
#21004 The shared secret you provided does not match the shared secret on file for your account.
#21005 The receipt server is not currently available.
#21006 This receipt is valid but the subscription has expired.
#21007 This receipt is a sandbox receipt, but it was sent to the production service for verification.
#21008 This receipt is a production receipt, but it was sent to the sandbox service for verification.

#Test time
#1 week = 3 minutes
#1 month = 5 minutes
#2 months = 10 minutes
#3 months = 15 minutes
#6 months = 30 minutes
#1 year = 1 hour