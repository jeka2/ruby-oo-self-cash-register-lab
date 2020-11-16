class CashRegister
    attr_accessor :total, :discount
    attr_reader :items
    def initialize(discount = false)
        @items = []
        @total = 0
        @discount = discount
    end

    def add_item(title, price, quantity = 1)
        quantity.times { @items << title }
        @last_transaction_price = price * quantity
        @total += (price * quantity)
    end

    def apply_discount
        if discount
            @total -= (@total * @discount / 100)
            return "After the discount, the total comes to $#{@total}."
        else 
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        @items.pop
        @total -= @last_transaction_price
    end 
end