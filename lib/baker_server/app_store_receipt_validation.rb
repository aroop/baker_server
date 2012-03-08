require 'uri'
require 'net/http'
require 'net/https'
require 'base64'

module BakerServer

  class AppStoreReceiptValidation
    def self.validate(receipt, sandbox = true)
      app_store_url = URI.parse(sandbox ? "https://sandbox.itunes.apple.com/verifyReceipt" : "https://buy.itunes.apple.com/verifyReceipt")

      request                  = Net::HTTP.new(app_store_url.host, app_store_url.port)
      request.use_ssl          = true
      request.verify_mode      = OpenSSL::SSL::VERIFY_NONE
      response, response_body  = request.post(app_store_url.path, {'receipt-data' => Base64.encode64(receipt)}.to_json.to_s, {'Content-Type' => 'application/x-www-form-urlencoded'})
      if response.code == '200'
        response_body
      end
    end
  end

end

#http://stackoverflow.com/questions/5017731/any-early-experiences-with-auto-renewable-subscriptions-for-ios
#APPLE_SHARED_PASS = "83f1ec5e7d864e89beef4d2402091cd0" #you can get this in iTunes Connect
#APPLE_RECEIPT_VERIFY_URL_SANDBOX    = "https://sandbox.itunes.apple.com/verifyReceipt"
#APPLE_RECEIPT_VERIFY_URL_PRODUCTION = "https://buy.itunes.apple.com/verifyReceipt"
#
#  def self.verify_receipt_for(b64_receipt, receipt_verify_url)
#    json_resp = nil
#    url = URI.parse(receipt_verify_url)
#    http = Net::HTTP.new(url.host, url.port)
#    http.use_ssl = true
#    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
#    json_request = {'receipt-data' => b64_receipt, 'password' => APPLE_SHARED_PASS}.to_json
#    resp, resp_body = http.post(url.path, json_request.to_s, {'Content-Type' => 'application/x-www-form-urlencoded'})
#    if resp.code == '200'
#      json_resp = JSON.parse(resp_body)
#    end
#    json_resp
#end
#
#def self.verify_receipt(b64_receipt)
#    json_resp = Subscription.verify_receipt_for(b64_receipt, APPLE_RECEIPT_VERIFY_URL_PRODUCTION)
#    if json_resp!=nil
#      if json_resp.kind_of? Hash
#        if json_resp['status']==21007
#          #try the sandbox then
#          json_resp = Subscription.verify_receipt_for(b64_receipt, APPLE_RECEIPT_VERIFY_URL_SANDBOX)
#        end
#      end
#    end
#    json_resp
#end
#App Store error responses
#21000 The App Store could not read the JSON object you provided.
#21002 The data in the receipt-data property was malformed.
#21003 The receipt could not be authenticated.
#21004 The shared secret you provided does not match the shared secret on file for your account.
#21005 The receipt server is not currently available.
#21006 This receipt is valid but the subscription has expired.