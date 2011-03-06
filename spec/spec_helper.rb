Dir["support/**/*.rb"].each {|f| require f }

if defined? RSpec
  RSpec.configure do |config|
    config.mock_with :rspec
  end
end
