module BakerServer
  class User < ActiveRecord::Base
    has_many :devise_tokens

    before_create :new_random_password

    protected
    def new_random_password
      self.password = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{email_address}--")[0, 6]
    end
  end
end
