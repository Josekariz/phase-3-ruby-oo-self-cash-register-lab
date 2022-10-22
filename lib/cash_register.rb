class CashRegister
  attr_accessor :total, :discount, :items, :prev

  def initialize(discount=nil, total=0, items=[])
    @total = total
    @discount = discount
    @items = items
  end

  def add_item(title, price, quantity=1)
    self.prev = price * quantity
    self.total += (price * quantity)
    quantity.times { @items.push(title) }
  end

  def apply_discount
    if @discount
      disc = self.discount / 100.0
      self.total -= (self.total * disc).to_i
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  # STILL NEED TO MAKE IT self.total RETURN 0.0
  def void_last_transaction
    void_item = @items.pop(1)
    self.total -= self.prev
  end

end