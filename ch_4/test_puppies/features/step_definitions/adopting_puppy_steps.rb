Given /^I am on the puppy adoption site$/ do
  visit(HomePage)
end

When /^I click the View Details button for "([^"]*)"$/ do |name|
  on(HomePage).select_puppy name
end


When /^I click the Adopt Me! button$/ do
  on(DetailsPage).add_to_cart
  @cart = ShoppingCartPage.new(@browser)
end

Then /^I should see "([^"]*)" as the name for (line item \d+)$/ do |name, line_item|
  on(ShoppingCartPage).name_for_line_item(line_item).should include name
end

When /^I should see "([^"]*)" as the subtotal for (line item \d+)$/ do |subtotal, line_item|
  on(ShoppingCartPage).subtotal_for_line_item(line_item) == subtotal
end

When /^I should see "([^"]*)" as the cart total$/ do |total|
  on(ShoppingCartPage).cart_total == total
end

When /^I click the Adopt Another Puppy button$/ do 
  on(ShoppingCartPage).continue_adopting_puppies
end

When /^I click the Complete the Adoption button$/ do 
  on(ShoppingCartPage).proceed_to_checkout
end

When /^I enter "([^\"]*)" in the name field$/ do |name|
  on(CheckOutPage).enter_name = name
end

When /^I enter "([^\"]*)" in the address field$/ do |address|
  on(CheckOutPage).enter_address = address
end

When /^I enter "([^\"]*)" in the email field$/ do |email|
  on(CheckOutPage).enter_email = email
end

When /^I select "([^\"]*)" from the pay with dropdown$/ do |pay_with|
  on(CheckOutPage).enter_pay_with = pay_with
end

When /^I click the Place Order button$/ do
  on(CheckOutPage).place_order
end

Then /^I should see "([^\"]*)"$/ do |expected_text|
  @current_page.text.should include expected_text
end
