# # Heroku deployment
# #class SassRailtie < Rails::Railtie
# #  require 'fileutils'
# #  initializer "create tmp/stylesheets for sass in heroku" do
#     FileUtils.mkdir_p(Rails.root.join("tmp", "stylesheets"))
# 
#     #Compass::AppIntegration::Rails.initialize!
# 
#     Rails.configuration.middleware.delete('Sass::Plugin::Rack')
#     Rails.configuration.middleware.insert_before('Rack::Sendfile', 'Sass::Plugin::Rack')
# 
#     Rails.configuration.middleware.insert_before('Rack::Sendfile', 'Rack::Static',
#         :urls => ['/stylesheets/compiled'],
#         :root => "#{Rails.root}")
# #  end
# #end