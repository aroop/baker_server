require 'uri'
require 'net/http'
require 'net/https'
require 'base64'

module BakerServer

  module AppStoreReceiptValidation
    def validate(receipt, sandbox = true)
      app_store_url = sandbox ? "https://sandbox.itunes.apple.com/verifyReceipt" : "https://buy.itunes.apple.com/verifyReceipt"

      request                  = Net::HTTP.new(app_store_url.host, app_store_url.port)
      request.use_ssl          = true
      request.set_content_type = 'application/json'
      request.verify_mode      = OpenSSL::SSL::VERIFY_NONE
      response, response_body  = request.post(url.path, {'receipt-data' => Base64.encode64(receipt)}.to_json.to_s)
      response.code == '200' && JSON.parse(response_body)['status'] == 0
    end
  end

end