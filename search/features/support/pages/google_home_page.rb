class GoogleHomePage
  include PageObject

    page_url "http://google.com"

    text_field(:search_field, id: "lst-ib")
end
