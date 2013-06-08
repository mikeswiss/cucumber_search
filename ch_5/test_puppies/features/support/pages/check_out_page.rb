class CheckoutPage
  include PageObject

  public
    text_field(:enter_name, :id => "order_name")
    text_field(:enter_address, :id => "order_address")
    text_field(:enter_email, :id => "order_email")
    select_list(:enter_pay_with, :id => 'order_pay_type')
    button(:place_order, :value => "Place Order")

    def checkout(data)
      self.enter_name = data['name']
      self.enter_address = data['address']
      self.enter_email = data['email']
      self.enter_pay_with = data['pay_type']
      self.place_order
    end

end
