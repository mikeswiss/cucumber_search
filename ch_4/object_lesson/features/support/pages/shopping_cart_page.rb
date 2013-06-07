class ShoppingCartPage
  def initialize(browser)
    @browser = browser
  end

  def row_for(line_item)
    (line_item - 1) * 6
  end

  def name_for_line_item(line_item)
    cart_line_item(line_item)[1].text
  end

  def subtotal_for_line_item(line_item)
    cart_line_item(line_item)[3].text
  end

  def cart_line_item(line_item)
    @browser.table(:index => 0)[row_for(line_item)]
#    @browser.table(:index => 0)[0]
  end

  def cart_total
    @browser.td(:class => 'total_cell').text
  end

end

#  @cart.name_for_line_item(@cart.row_for(line_item)).should include name
