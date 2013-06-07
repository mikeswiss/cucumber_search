Given /^I am on the puppy adoption site$/ do
  @browser.goto "http://puppies.herokuapp.com"
end

When /^I click the "([^\"]*)" button$/ do |button_value|
  @browser.button(:value => button_value).click
end

When /^I click the Adopt Me! button$/ do
  @browser.button(:value => "Adopt Me!").click
  @cart = ShoppingCartPage.new(@browser)
end

When /^I click the second "([^\"]*)" button$/ do |button_value|
  @browser.button(:value => button_value, :index => 1).click
end

When /^I enter "([^\"]*)" in the name field$/ do |name|
  @browser.text_field(:id => "order_name").set(name)
end

When /^I enter "([^\"]*)" in the address field$/ do |address|
  @browser.text_field(:id => 'order_address').set(address)
end

When /^I enter "([^\"]*)" in the email field$/ do |email|
  @browser.text_field(:id => 'order_email').set(email)
end

When /^I select "([^\"]*)" from the pay with dropdown$/ do |pay_with|
  @browser.select_list(:id => 'order_pay_type').select(pay_with)
end

Then /^I should see "([^\"]*)"$/ do |expected_text|
  @browser.text.should include expected_text
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

