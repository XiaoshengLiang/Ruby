require_relative 'q1_check'
require_relative 'q1_division'

def get_numbers
    puts "what's your divident?"
    divident=gets.chomp().to_i
    puts "what's your divisor?"
    divisor=gets.chomp().to_i
    if divisor==0
        print_error
        else division(divident,divisor)
    end
end

get_numbers