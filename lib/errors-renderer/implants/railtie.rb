module ErrorsRenderer::Implants
  class Railtie < Rails::Railtie
    initializer "errors-renderer" do |app|
      ActiveSupport.on_load :action_controller do
        require 'errors-renderer/implants/controller_actions'
      end
    end
  end
end
