module ErrorsRenderer
  module Localizor
    def self.get_message_from_code(code)
      I18n.t('default.errors.messages')[code.to_sym]
    end

    def self.get_code_from_message(message)
      I18n.t('default.errors.messages').invert[message]
    end
  end
end
