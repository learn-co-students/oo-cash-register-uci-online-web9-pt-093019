require 'pry'
class CashRegister

  attr_accessor :discount, :total, :price, :quantity, :items

  def initialize(discount = 0)
    @discount = discount
    @total = 0
    @items = []
  end
  
  def add_item(item, price, quantity=1)
    @quantity = quantity
    @subtotal = price * @quantity
    self.total += @subtotal
    self.quantity.times { items << item }
  end
  
  def apply_discount
    @discount = self.total * (self.discount / 100.00)
    self.total -= self.discount
    if @discount > 0
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end
  # def items
  #   @items
  # end
  def void_last_transaction
    self.total -= @subtotal
    # quantity.times { @items.pop }
  end

end
