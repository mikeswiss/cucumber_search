require 'page-object'
require 'data_magic'
require 'byebug'
require 'net/http'
World(PageObject::PageFactory)

if ENV['HEADLESS'] == 'true'
  require 'headless'

  headless = Headless.new
  headless.start

  at_exit do
    headless.destroy
  end
end
