class Developer
    attr_accessor :net_worth, :loans, :banks_loaned_from, :balance, :bankrupt
    def initialize(net_worth,loans,banks_loaned_from,bankrupt)
        @net_worth=net_worth
        @loans=loans
        @banks_loaned_from=banks_loaned_from
        @bankrupt=bankrupt
    end
    
#    The method determines whether the developer is solvent using balance
    def is_developer_solvent?
        if balance >= 0
            print "*****The developer is solvent.*****","\n"
            true
        else print "*****The developer isn't solvent.*****","\n"
            false
        end
    end

#    The method calculate the balance of developer through net north and loans
    def owes_amount
        loans=@loans
        net_worth=@net_worth
        @balance = net_worth-loans
        print "the balance is : ",balance,"\n"
        is_developer_solvent?
    end

#    The method is getting the status of developer (bankrupt or not)
    def get_bankrupt
        bankrupt=@bankrupt
        return bankrupt
    end
end

#developer1=Developer.new("Johnny",19,20,"AIB","yes")
#developer1.owes_amount