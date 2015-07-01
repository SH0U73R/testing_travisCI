class Potter

  BOOK_PRICE = 8
  #Percentages
  PERC_1 = 0.95
  PERC_2 = 0.90
  PERC_3 = 0.80
  PERC_4 = 0.75

  #Main invocation for returning the price
  def price(books)
    #Checks for an empty collection
      if books.empty?
        return 0
      else
        count_collection(books)
      end      
  end


  private
  def count_collection(books)
    #Refactor using books.reduce :+
    cart = Array.new   
      books.each{|k, v| cart.push(v) if v > 0}

    if cart.length > 1    
      full_collection(cart)
    else      
      return cart.max * BOOK_PRICE
    end
  end

  
end 

#count will take the original value
#new_set will take only number ones

def full_collection(count)
    value = count.length
     case value
     when 2
       value = BOOK_PRICE * value * PERC_1   
     when 3
       value = BOOK_PRICE * value * PERC_2
     when 4
       value = BOOK_PRICE * value * PERC_3
     when 5
       value = BOOK_PRICE * value * PERC_4
     end
  end


count = [2, 1]

def disscount(count)  
newset = [1, 1]
sum = 0
c = Array.new 
  count.each do |i|
    #Saves the length of the value for disscount calculation
    #iteration = count.value

    #Saves the sumatory of disscount
    sum += 8 * count.length * 0.95 if count.length > 1
    
    #Reduces by one on the array and re asign the new values for count
    count = count.zip(newset).map { |x, y| x - y }
  
    c = count
    c.delete(0)
  
    count = c
    sum += 8 if count.length == 1
    puts sum
    #Deletes the zeroes
    #count.delete(0)
    #p.delete(0)
  end
end