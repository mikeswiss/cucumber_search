
require 'rspec-expectations'
require 'page-object'

if ENV['HEADLESS'] == 'true'
  require 'headless'

  headless = Headless.new
  headless.start

  at_exit do
    headless.destroy
  end
end

World(PageObject::PageFactory)

