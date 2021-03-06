require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Oxygenarabi
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # Switch i18n.locale from Enlish to Arabic
    config.i18n.default_locale = :ar

=begin
    # or you could go with utf8_unicode_ci instead of utf8_general_ci. 
    # In my current instance i have utf8_unicode_ci
    # irb(main):005:0> ActiveRecord::Base.connection.collation
    # => "utf8_unicode_ci"  

    console do
      ActiveRecord::Base.connection.execute "SET collation_database ='utf8_general_ci' "
      ActiveRecord::Base.connection.execute "SET collation_connection ='utf8_general_ci' "
    end
=end
  end
end
