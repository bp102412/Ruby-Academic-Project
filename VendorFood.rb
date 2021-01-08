class VendorFood
  @@total_sales = 0
  @@total_supply = 0
  @@sales_log = []
  def initialize(name, price, vending_number)
    @name = name
    @price = price
    @vending_number = vending_number
    @supply = 0 #not asked for, edited via method calls
  end

  def stock_item(num) #add to item supply and overall vending machine supply
    @supply += num
    @@total_supply += num
  end

  def vend_item #decrement item supply and machine total supply
    if @supply >= 1
      @supply -= 1
      @@total_supply -= 1
      self.update_sales(@price) # ibcrease total sales by cose of the item
      self.save_log
    end
  end

  def update_sales(cost) # ibcrease total sales by cose of the item
    @@total_sales += cost
    @@sales_log.append([self])
  end

  def to_s
    puts "Total Sales: #{@@total_sales}\nVending Machine Supply Of Everything: #{@@total_supply}\nName: #{@name}\nPrice: #{@price}\nSupply: #{@supply}\n\n"
  end

  attr_reader :name
  attr_writer :name

  attr_reader :price
  attr_writer :price

  attr_reader :vending_number
  attr_writer :vending_number

  def sales
    @@total_sales
  end
  def supply
    @@total_supply
  end
  def sales_log
    @@sales_log
  end

  def save_log
    File.open("sales_log", "a") do |file|
      file.puts"#{self.name} | #{self.price} | #{self.vending_number}"
    end
  end

  def read_log(val = nil) #this works as both functions, when function is called with no parameters, val is nil and all lines are read and output
    if val==nil
      File.open("sales_log", "r") do |file|
        file.each do |line|
          line = line.gsub("\n","")
          line_as_array = line.split(" | ")
          puts "Item Name: #{line_as_array[0]}, Item Price: #{line_as_array[1]}, Vending Number: #{line_as_array[2]}"
        end
      end
    else #otherwise it checks the name and vending number to see if they match the provided value
      File.open("sales_log","r") do |file|
        total = 0
        file.each do |line|
          line = line.gsub("\n","")
          line_as_array = line.split(" | ")
          line_as_array.delete_at(1)
          if line_as_array[0] == val.to_s.capitalize || line_as_array[1] == val.to_s
            total += 1
          end
        end
        puts "#{total} sales for item #{val}"
      end
    end #end if
  end # end func


end
