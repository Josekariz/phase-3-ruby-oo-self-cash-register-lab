class CashRegister
  attr_accessor :discount,:total,:last_transaction,:items

  def initialize(discount = 0)
      @discount = discount
      @total = 0
      @items = []
  end

  def add_item (title,price,quantity = 1)
      self.last_transaction = price * quantity
      self.total += self.last_transaction
      quantity.times do 
          self.items << title
      end
  end

  def apply_discount
      if self.discount > 0
          percdisc = ( self.discount.to_f) / 100
          self.total -= (self.total * percdisc).to_i
          "After the discount, the total comes to $#{self.total}."
      else
          "There is no discount to apply."
      end
  end

  def void_last_transaction
      self.total -= self.last_transaction
  end

end
