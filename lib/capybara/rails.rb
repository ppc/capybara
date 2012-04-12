require 'capybara'
require 'capybara/dsl'

Capybara.app = Rack::Builder.new do
  map "/" do
    if Rails.version.to_f >= 3.0
      run Rails.application  
    else # Rails 2
      use Rails::Rack::Static
      run ActionController::Dispatcher.new
    end
  end
end.to_app

Capybara.asset_root = Pathname.new File.join(Rails.root, 'public')
Capybara.save_and_open_page_path = Pathname.new File.join(Rails.root, 'tmp', 'capybara')

