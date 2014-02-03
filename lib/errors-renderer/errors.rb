module ErrorsRenderer
  class Errors
    def initialize(errors_or_record, options={})
      options.reverse_merge! controller: nil, action: nil

      @errors = parse_raw_errors errors_or_record
      @root_name = get_root_name options[:controller], options[:action]
    end

    def all
      @errors
    end

    def codes
      @errors.map{ |e| e[:code] }.compact
    end

    def empty?
      @errors.empty?
    end

    def full_codes
      @errors.map { |e| e[:full_code] }.compact
    end

    def full_messages
      @errors.map{ |e| e[:full_message] }.compact
    end

    def localize
      ErrorsRenderer::Localizor
    end

    def root_name
      @root_name
    end

    def to_json
      result = @errors.map do |e|
        err = { code: e[:full_code], message: e[:full_message] }
        err[:field] = e[:field] if e[:field]

        err
      end

      return result.to_json
    end

    private

    def get_root_name(controller, action)
      if action == 'index'
        controller
      else
        controller.singularize
      end
    end

    def parse_error(code, message, field=nil, full_message=nil)
      error = { code: code, message: message }

      if field == :base
        field = nil
        full_message = message
      end

      error[:field] = field if field
      error[:full_message] = full_message || message
      error[:full_code] = [field, code].compact.join('_')

      return error
    end

    def parse_error_from_code(code)
      parse_error code, I18n.t("errors.messages.#{code}")
    end

    def parse_raw_errors(errors_or_record)
      if errors_or_record.is_a? String
        [parse_error_from_code(errors_or_record)]
      elsif errors_or_record.is_a? Array
        errors_or_record.map { |e| parse_error_from_code e }
      else
        parse_record_errors errors_or_record
      end
    end

    # TOFIX: Dependencies
    # translate_with_article
    # bbl.field_label
    # downcase_utf8
    def parse_record_errors(record)
      errors = []

      record.errors.each do |e,b|
        full_message = [I18n.translate_with_article('form.field'), record.bbl.field_label(e).downcase_utf8, b].join(' ')

        errors << parse_error(localize.get_code_from_message(b), b, e, full_message)
      end

      return errors
    end
  end
end
