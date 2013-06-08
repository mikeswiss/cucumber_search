Given /^I am on the puppy adoption site$/ do
  @browser.goto "http://puppies.herokuapp.com"
end

When /^I click the "([^\"]*)" button$/ do |button_value|
  @browser.button(:value => button_value).click
end

When /^I click the second "([^\"]*)" button$/ do |button_value|
  @browser.button(:value => button_value, :index => 1).click
end

When /^I click the Adopt Me! button$/ do
  @browser.button(:value => "Adopt Me!").click
  @cart = ShoppingCartPage.new(@browser)
end

Then /^I should see "([^"]*)" as the name for line item (\d+)$/ do |name, line_item|
  @cart.name_for_line_item(line_item.to_i).should include name
end

When /^I should see "([^"]*)" as the subtotal for line item (\d+)$/ do |subtotal, line_item|
  @cart.subtotal_for_line_item(line_item.to_i) == subtotal
end

When /^I should see "([^"]*)" as the cart total$/ do |total|
  @cart.cart_total == total
end

When /^I click the Adopt Another Puppy button$/ do 
  @cart.continue_adopting_puppies
end

When /^I click the Complete the Adoption button$/ do 
  @cart.proceed_to_checkout
  @checkout = CheckOutPage.new(@browser)
end

When /^I enter "([^\"]*)" in the name field$/ do |name|
  @checkout.enter_name(name)
end

When /^I enter "([^\"]*)" in the address field$/ do |address|
  @checkout.enter_address(address)
end

When /^I enter "([^\"]*)" in the email field$/ do |email|
  @checkout.enter_email(email)
end

When /^I select "([^\"]*)" from the pay with dropdown$/ do |pay_with|
  @checkout.enter_pay_with(pay_with)
end

Then /^I should see "([^\"]*)"$/ do |expected_text|
  @browser.text.should include expected_text
end
