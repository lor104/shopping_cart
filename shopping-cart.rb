require './stuff.rb'

class ShoppingCart

  attr_reader :cart

  def initialize
    @cart = []
  end

  def add(name, base_price, tax_rate)
    @cart << Stuff.new(name, base_price, tax_rate)
    return @cart
  end

  def remove(name)
    @cart.delete_if {name == @cart.name}
  end

  def total_cost
    total = 0
    @cart.each do |product|
      total += product.base_price
    end
    return total
  end

  def total_cost_with_tax
    total = 0
    @cart.each do |product|
      price = product.base_price * (1 + product.tax_rate)
      total += price
    end
    return total
  end

end


# def initialize(name, base_price, tax_rate)
#   @product = {:name => name, :base_price = base_price, :tax_rate => tax_rate}
# end
