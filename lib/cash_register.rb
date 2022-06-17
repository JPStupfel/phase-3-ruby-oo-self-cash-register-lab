require 'pry'

class Sticker
    attr_accessor :title, :price, :quantity

    def initialize title, price, quantity
        @title = title
        @price = price
        @quantity = quantity
    end

end

class CashRegister
    attr_accessor :discount, :total, :items, :ticket

    def initialize(discount_value=0)
        @discount = discount_value
        @total = 0.0
        @items =[]
        @ticket =[]
    end

    def add_item title, price, quantity=1
        @total= self.total + (price * quantity)
        @items= self.items + ([title] * quantity)

        newSticker = Sticker.new(title, price, quantity)
        @ticket = self.ticket.push(newSticker)
        
    end

    def apply_discount
        unless @discount == 0
        @total= self.total - (self.total * ( self.discount/100.0))
        "After the discount, the total comes to $#{self.total.to_i}."
        else "There is no discount to apply."
        end
    end

    def void_last_transaction
        item = self.ticket.last
        add_item "void-#{item.title}", (0-item.price), item.quantity

    end

end

 x = CashRegister.new 20
binding.pry