class Potter

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

  #Calculates the price for a single book bougth (One or more copies of the same book)
  def single_collection(book_count)
    value = 0
    book_count.each do |x|
      if x > 0
        value = x
      end
    end
    return result = value * 8
  end

  #
  def count_collection(books)
    x = 0
    book_count = Array.new
    book_count = books.values
      book_count.each do |i|
        if i.to_i > 0
           x += 1
        end          
      end

    if x > 1
      #What values have each book collection
      full_collection(book_count)
    else      
      single_collection(book_count)
    end

    #if x > 1
    #  result = 8 * x * 0.95#Here i need to find a way to catch the disscount      
    #else
    #  return book_count[0] * 8
    #end

  end

  def full_collection(count)
    value = 0
    count.each do |x|
      if x > 0
        value += x
      end
    end
    
    case value
    when 2
      value = 8 * value * 0.95
    when 3
      value = 8 * value * 0.90
    when 4
      value = 8 * value * 0.80
    when 5
      value = 8 * value * 0.75
    end

  end

end 
#p.price({b1: 1, b2:0, b3: 0, b4: 0, b5: 1})