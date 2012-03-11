module BakerServer
  module ApplicationHelper

    def qualified_url(path)
      "#{request.protocol}#{request.host_with_port}#{path}"
    end

    def render_image(image_object, width=100, height=100)
      image_object.present? ? image_tag(image_object.thumb("#{width}x#{height}").url) : ""
    end

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
