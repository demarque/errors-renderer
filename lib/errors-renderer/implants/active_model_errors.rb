module ErrorsRenderer::Implants
  module ActiveModelErrors
    def add_from_code(attribute, code)
      self.add attribute, ErrorsRenderer::Localizor.get_message_from_code(code)
    end

    def add_to_model(code)
      self.add :base, ErrorsRenderer::Localizor.get_message_from_code(code)
    end
  end
end

ActiveModel::Errors.send :include, ErrorsRenderer::Implants::ActiveModelErrors if defined? ActiveModel
