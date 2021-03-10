require 'spec_helper'

RSpec.describe ErrorsRenderer::Implants::ActiveModelErrors do
  let(:errors) do
    ::ActiveModel::Errors.new(base)
  end

  let(:base) { double('base') }

  describe '#add_from_code' do
    let(:attribute) { :attribute }
    let(:code)      { :code      }

    it 'is not tested' do
      pending

      errors.add_from_code(attribute, code)
    end
  end

  describe '#add_to_model' do
    let(:code) { :code }

    it 'is not tested' do
      pending

      errors.add_to_model(code)
    end
  end
end
