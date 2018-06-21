Given("I am on the Google Homepage") do
  visit(GoogleHomePage)
end

When("I search for {string}") do |search_term|
  on(GoogleHomePage) do |page|
    page.search_field = search_term
    page.search_field_element.send_keys(:enter)
  end
end

Then("the url should contain {string}") do |search_term|
  # Replace spaces with + signs as thats what google does in the url
  search_term = search_term.gsub(" ", "+")
  expect(@browser.url).to include search_term
end

Then("the search results should contain {string}") do |search_term|
  on(GoogleResultsPage)do |page|
    results_count = page.results_container_element.text.scan("#{search_term}").count
    puts "#{search_term} is on the results page #{results_count} times"
    expect(results_count).to be > 0

  end
end

Given("a {string} currency pair") do |string|
  @currency = string
end

When("I search the api for the currency") do
   @uri = URI("https://api.itbit.com/v1/markets/#{@currency}/ticker")
end

Then("the currency should be returned in the results") do
  response = JSON.parse(Net::HTTP.get(@uri))
  expect(response['pair']).to eql(@currency)
end
