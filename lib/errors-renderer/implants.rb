module ErrorsRenderer
  module Implants
  end
end

if defined? Rails::Railtie
  require 'errors-renderer/implants/railtie'
elsif defined? Rails::Initializer
  raise "errors-renderer is not compatible with Rails 2.3 or older"
end

require 'errors-renderer/implants/active_model_errors'
