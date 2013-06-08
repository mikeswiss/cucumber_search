class ShoppingCartPage
  include PageObject

  NAME_COLUMN = 1
  SUBTOTAL_COLUMN = 3
  LINES_PER_PUPPY = 6

  public
      button(:continue_adopting_puppies, :value => 'Adopt Another Puppy')
      button(:proceed_to_checkout, :value => 'Complete the Adoption')
      table(:cart, :index => 0)
      cell(:cart_total, :class => 'total_cell')

  public
    def name_for_line_item(line_item)
      table_value(line_item, NAME_COLUMN)
    end

  public
    def subtotal_for_line_item(line_item)
      table_value(line_item, SUBTOTAL_COLUMN)
    end

  private
    def table_value(line_item, column)
      row = (line_item.to_i - 1) * LINES_PER_PUPPY
      cart_element[row][column].text
    end

end
