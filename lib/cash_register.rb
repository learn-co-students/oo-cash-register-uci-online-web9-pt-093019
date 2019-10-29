
require 'pry'

class CashRegister
  attr_accessor :total, :item_price, :item_quantity, :discount, :items, :last_transaction

  def initialize(discount = 0)
    @items = []
    @discount = discount
    @total = 0
  end

  def total
    @total
  end

  def add_item(item, price, quantity=1)
    @items << [item] * quantity
    @last_transaction = (price * quantity)
    @total = @total + @last_transaction
  end

  def apply_discount
    if @discount == 0
      p "There is no discount to apply."
    else
      @total = @total.to_f * (100 - @discount.to_f) * 0.01
      p "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def items
    @items.flatten
  end

  def void_last_transaction
    @total = @total - @last_transaction
  end
end
