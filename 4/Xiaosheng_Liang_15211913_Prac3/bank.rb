
class Bank
    attr_accessor :cash_deposits, :amount_of_loans, :losses, :in_nama, :loan_book
    def initialize(cash_deposits,amount_of_loans,in_nama)
        @cash_deposits=cash_deposits
        @amount_of_loans=amount_of_loans
        @in_nama=in_nama
    end
    
#    the method determines whether the bank is solvent
    def is_solvent(losses)
        loan_book=200000
        cash_deposits=@cash_deposits
#        print "losses is: ", losses,"\n"
        if loan_book<=6*(cash_deposits-losses)
            then print "The bank is solvent.","\n"
        else print "The bank is insolvent.","\n"
             make_solvent
        end
    end
    
#    The method would uff-load some loans to NAMA
    def make_solvent
        amount_of_loans=@amount_of_loans
        in_nama=@in_nama
        cash_deposits=@cash_deposits
        amount_of_loans=amount_of_loans-in_nama
#        print "loans: ",amount_of_loans,"\n"
        move_loans_to_nama
    end
    
#    the method indicates NAMA would pay a bank 30% of the value
    def move_loans_to_nama
        cash_deposits=@cash_deposits
        cash_deposits=cash_deposits+(0.3*in_nama)
#        print "cash_deposits: ", cash_deposits,"\n"
    end
    
    
end


#AIB = Bank.new(40, 50, 30, 10)
#AIB.is_solvent
