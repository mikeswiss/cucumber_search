require 'watir'

Before do
  if ENV['BROWSER'] == 'firefox'
    @browser = Watir::Browser.new :firefox
  elsif ENV['BROWSER'] == 'chrome'
    @browser = Watir::Browser.new :chrome
  else
    @browser = Watir::Browser.new :firefox
  end
end


After do
  @browser.close
end
