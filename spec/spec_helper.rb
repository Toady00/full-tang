$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", "lib"))

require "bundler"
Bundler.setup

# require 'full_tang'

Dir["#{File.expand_path("../../lib/full_tang/core_ext", __FILE__)}/**/*.rb"].each {|f| require f}

require 'rspec'
require 'timecop'

RSpec.configure do |config|
  config.before do
    Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
  end

  config.order = "random"
end
