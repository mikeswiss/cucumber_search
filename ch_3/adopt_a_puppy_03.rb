#!/usr/bin/env ruby
require 'rubygems'
require 'watir-webdriver'
require_relative 'adoption_helper'
include AdoptionHelper

goto_puppy_shopping_site('http://puppies.herokuapp.com')
adopt_puppy_number(1)
continue_adopting_puppies()
adopt_puppy_number(2)
checkout_with("name", "address", "email@email.com", "Check")
verify_page_contains('Thank you for adopting a puppy!')
close_the_browser
