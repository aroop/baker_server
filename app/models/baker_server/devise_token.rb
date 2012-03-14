module BakerServer
  class DeviseToken < ActiveRecord::Base
    belongs_to :user
    validates_presence_of :token
  end
end
