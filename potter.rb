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
    cart = Array.new   
      books.each{|k, v| cart.push(v) if v > 0}

    if cart.length > 1
      #puts "This are the values of cart #{cart}"
      full_collection(cart)
    else      
      return cart.max * BOOK_PRICE
    end
  end

  def full_collection(count)
    value = count.length
    #{b1: 2, b2: 1, b3: 0, b4: 0, b5: 0}
    #Actual procedure value = 8 * value * 0.95 
    #Neede procedure value = 8 + (8 * value * 0.95)
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

end 
#p.price({b1: 2, b2: 1, b3: 0, b4: 0, b5: 0})