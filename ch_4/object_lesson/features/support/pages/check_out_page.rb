class CheckOutPage

  public
    def initialize(browser)
      @browser = browser
    end

  public
    def enter_name(name)
      @browser.text_field(:id => "order_name").set(name)
    end

  public
    def enter_address(address)
      @browser.text_field(:id => 'order_address').set(address)
    end

  public
    def enter_email(email)
      @browser.text_field(:id => 'order_email').set(email)
    end

  public
    def enter_pay_with(pay_with)
      @browser.select_list(:id => 'order_pay_type').select(pay_with)
    end

end
