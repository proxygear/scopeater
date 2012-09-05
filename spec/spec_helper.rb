require 'rspec'

Dir[File.join("./spec/support/**/*.rb")].each do |f|
  require f
end

require 'scopeater'

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter     = 'documentation'
end