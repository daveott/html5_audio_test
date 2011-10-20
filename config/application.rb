require File.expand_path('../boot', __FILE__)

require 'rails/all'
require File.expand_path("../../lib/form_builder", __FILE__)

if defined?(Bundler)
  Bundler.require(*Rails.groups(:assets => %w(development test)))
end

module Html5AudioTest
  class Application < Rails::Application
    config.autoload_paths += %W(#{Rails.root}/lib)
    config.encoding = "utf-8"
    config.filter_parameters += [:password]
    config.assets.enabled = true
    config.assets.version = '1.0'
    config.action_view.default_form_builder = ::FormBuilder
    config.generators do |g|
      g.assets              false
      g.controller          :helper => false, :test_framework => false
      g.fixture_replacement :fabrication
      g.template_engine     :haml
    end

  end
end
