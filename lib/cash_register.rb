require 'pry'
class CashRegister

attr_accessor :total, :discount, :last_trans
attr_reader :basket

def basket=(title,qty)
  @basket << {title => qty}
end

def initialize(emp_disc=0)
  @total = 0.0
  @discount = emp_disc
  @basket = [] #array of {item_title => qty} hashes
end



def add_item(title, price, qty=1)
  last_price = price*qty
  @last_trans = [title, last_price, qty]
  @total += last_price

  index = basket.index {|item| item.key?(title)}
  #if the item already exists, increment the quantity. Otherwise add item.
  if index
    @basket[index][title] += qty
  else
    @basket << {title => qty}
  end #end of if block

end # end of add item method

def apply_discount
  if discount != 0
new_total = (@total * (100-@discount) / 100)
#discount is an integer representing a percentage
@total = new_total
"After the discount, the total comes to $#{@total.to_i}."
else
  "There is no discount to apply."
end #end of if block
end # end of method apply_discount

def items
items = []
@basket.each do |pairs|
  pairs.each do |title, qty|
    i = 0
    while i < qty
      items << title
      i += 1
    end #end of while loop
  end #end of pairs each block
end #end of basket each block
items
end # end of items method

def void_last_transaction
  #  @last_trans = [title, last_price, qty] (for reference)

@total -= @last_trans[1]

#remove from basket
index = @basket.index {|item| item.key?(last_trans[0])}
@basket[index][last_trans[0]] -= last_trans[2]

end #end of void transaction method


end # end of class cash register
