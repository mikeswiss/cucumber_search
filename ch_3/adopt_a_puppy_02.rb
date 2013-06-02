#!/usr/bin/env ruby
require 'rubygems'
require 'watir-webdriver'
@browser = Watir::Browser.new :firefox

def goto_puppy_shopping_site
  @browser.goto 'http://puppies.herokuapp.com'
end

def adopt_puppy_number(number)
  @browser.button( :value => 'View Details', :index => number - 1 ).click
  @browser.button(:value => 'Adopt Me!').click
end

def continue_adopting_puppies
  @browser.button(:value => 'Adopt Another Puppy').click
end

def checkout_with(name, address, email, paytype)
  @browser.button(:value => 'Complete the Adoption').click
  @browser.text_field(:id => 'order_name').set(name)
  @browser.text_field(:id => 'order_address').set(address)
  @browser.text_field(:id => 'order_email').set(email)
  @browser.select_list(:id => 'order_pay_type').select(paytype)
  @browser.button(:value => 'Place Order').click
end

def verify_page_contains(text)
  fail 'Browser did not contain expectedtext' unless @browser.text.include? text
end

def close_the_browser
  @browser.close
end
  

goto_puppy_shopping_site()
adopt_puppy_number(1)
continue_adopting_puppies()
adopt_puppy_number(2)
checkout_with("name", "address", "email@email.com", "Check")
verify_page_contains('Thank you for adopting a puppy!')
close_the_browser
