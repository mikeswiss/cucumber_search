class ShoppingCartPage

  NAME_COLUMN = 1
  SUBTOTAL_COLUMN = 3
  LINES_PER_PUPPY = 6

  public
    def initialize(browser)
      @browser = browser
    end

  private
    def row_for(line_item)
      (line_item - 1) * LINES_PER_PUPPY
    end

  public
    def name_for_line_item(line_item)
      cart_line_item(line_item)[NAME_COLUMN].text
    end

  public
    def subtotal_for_line_item(line_item)
      cart_line_item(line_item)[SUBTOTAL_COLUMN].text
    end

  private
    def cart_line_item(line_item)
      @browser.table(:index => 0)[row_for(line_item)]
    end

  public
    def cart_total
      @browser.td(:class => 'total_cell').text
    end

  public
    def continue_adopting_puppies
      @browser.button(:value => 'Adopt Another Puppy').click
    end

  public
    def proceed_to_checkout
      @browser.button(:value => 'Complete the Adoption').click
    end

end
