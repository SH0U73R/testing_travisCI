class Potter

#Constants
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
      disscount(cart)
    else      
      return cart.max * BOOK_PRICE
    end
  end

  def best_disscount(count)
    #First, take out the full quantity if books (We already know that they are different books)
    max_set = count.inject {|sum, x| sum + x}
    #Then find out if we can make some even distribution
    if max_set.even?
      newset = Array.new(4)
      newset = newset.map { |p| 2 }
    else
      #puts "Not even :D"
    end
    return newset
  end

  def disscount(count)
    sum = 0    
    c = Array.new 
      count.each do |i|
        newset = Array.new(count.length)
        newset = newset.map { |p| 1 }
        #Saves the length of the value for disscount calculation
        iteration = count.length
        case iteration
         when 1
          sum += BOOK_PRICE        
         when 2
           sum += BOOK_PRICE * iteration * 0.95
         when 3
           sum += BOOK_PRICE * iteration * 0.90
         when 4
           sum += BOOK_PRICE * iteration * 0.80
         when 5
           sum += BOOK_PRICE * iteration * 0.75
         end      
        #Reduces by one on the array and re asign the new values for count
        count = count.zip(newset).map { |x, y| x - y }  
        c = count
        c.delete(0)  
        count = c      
    end    
    return sum
  end
  

end

