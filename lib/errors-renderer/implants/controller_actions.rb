module ErrorsRenderer::Implants
  module ControllerActions
    extend ActiveSupport::Concern

    included do
      helper_method :response_errors
    end

    def render_errors(status, errors_or_record, options={})
      options.reverse_merge! template: 'errors/response'

      self.response.extend ResponseErrorAttribute

      @response_errors = ErrorsRenderer::Errors.new(errors_or_record, controller: self.request[:controller], action: self.request[:action])
      @response_error_codes = @response_errors.full_codes

      self.response.error_codes = @response_error_codes
      self.response.status = status
      self.respond_to do |format|
        format.any(:json, :xml) { self.render(template: options[:template]) }
        # html and neatpage yet
        format.any { self.render(template: 'errors/response') }
      end
    end

    def response_errors?
      @response_errors and not response_errors.empty?
    end

    def response_errors
      @response_errors
    end

    def response_error_codes
      @response_error_codes
    end

    module ResponseErrorAttribute
      attr_accessor :error_codes
    end

    ::ActionController::Base.send :include, self
  end

end
