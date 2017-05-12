# application.rb
require 'grape'
require 'mongoid'

# Load files from the models and api folders
Dir["#{File.dirname(__FILE__)}/models/**/*.rb"].each { |f| require f }
Dir["#{File.dirname(__FILE__)}/controllers/**/*.rb"].each { |f| require f }
Dir["#{File.dirname(__FILE__)}/config/**/*.rb"].each { |f| require f }

Mongoid.load! "config/mongoid.config"

# Grape API class. We will inherit from it in our future controllers.
module API
  class Root < Grape::API
    format :json
    prefix :api

    # Simple endpoint to get the current status of our API.
    get :status do
      { status: 'ok' }
    end

    mount V1::Admin::Posts
    mount V1::Comments
    mount V1::Posts
  end
end

# Mounting the Grape application
ApiApp = Rack::Builder.new {
  map "/" do
    run API::Root
  end
}
