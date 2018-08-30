def isbn_dash(num)
    num = num.tr('-', '')
    num = num.tr(' ', '')
end
def invalid_characters(isbn2)
    # num5 = num.gsub(/[^0-9xX]/, '')
    # num5
    verify = false
    # arr = ["*", "$"]
    # arr.each do |item|
    #   if isbn2.include?(item)
    #       verify = true
    #   end
    # end
    if isbn2[-1] == "x" || isbn2[-1] == "X"
        isbn2_chopped = isbn2.chop
        p "test that isbn2 chopped is #{isbn2_chopped}"
        verify = isbn2_chopped.count("^0-9, []").zero?
    else
        verify = isbn2.count("^0-9, []").zero?
    end
    verify
end
def master_function(num)
    num2 = isbn_dash(num)
    chek = num2.length
    if chek == 13
        num2 = isbn_13(num2)
    elsif chek == 10
        num2 = isbn_10(num2)
    else
        return false
    end
    num2
end

def isbn_10(num2)
    
    num3 = num2.split('')
    if num3.last.downcase == "x"
        num3.pop
        num3 << "10" 
    end
    num3.each do |val|
        if val.to_i.to_s != val
            return false
        end
    end 
    counter = 10
    check_arr = []
    num3.each.with_index(1) do |n, index|
        chk = n.to_i*counter
        counter -= 1
        check_arr << chk
    end
    check_num = check_arr.sum
    check_num = check_num % 11
    check_num
    if check_num == 0
       return true
    else
        return false
    end
    
end

def isbn_13(num2)
    num3 = num2.split('')
    var = num3.pop
    teen_arr = []
    num3.each.with_index(1) do |n, index|
        if index.even?
            v = n.to_i*3
            teen_arr << v
        else 
            m = n.to_i*1
            teen_arr << m
        end                
    end
    check = teen_arr.sum
    check %= 10
    check = 10 - check
    check
    if check.to_s.length == 2
        check %= 10
    end
    if check.to_s == var
        return true
    else
        return false
    end
end