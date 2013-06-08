class CheckOutPage
  include PageObject

  public
    text_field(:enter_name, :id => "order_name")
    text_field(:enter_address, :id => "order_address")
    text_field(:enter_email, :id => "order_email")
    select_list(:enter_pay_with, :id => 'order_pay_type')
    button(:place_order, :value => "Place Order")

end
