module BakerServer
  module ApplicationHelper

    def bootstrap_flash_class(type)
      case type
        when :alert
          "alert-warning"
        when :error
          "alert-error"
        when :notice
          "alert-info"
        when :success
          "alert-success"
        else
          type.to_s
      end
    end

  end
end
