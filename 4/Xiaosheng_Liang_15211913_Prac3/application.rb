require_relative "bank"
require_relative "developer"

#The method is getting the status of bank(bankrupt or not, solvent or not),becoming loans to losses of bank and knock on effect for bank concerned
def declared_bankrupt(loans,losses,instance_bank,instance_developer)
    losses=0
    status=instance_developer.get_bankrupt
    if status == "yes"
        then losses=loans
             loans=0
             instance_bank.is_solvent(losses)
    else print "The bank isn't bankrupt.","\n"
    end
    instance_developer.owes_amount
end

#Identify the instances of Bank and Developer
AIB = Bank.new(40000,50000,10000)
Angio = Bank.new(100000,10000,10000)
BOI = Bank.new(20000,15000,15000)
RBS = Bank.new(200000, 50000, 30000)
Ulster = Bank.new(500000,15000,15000)

Johnny=Developer.new(66000,20000,"AIB","yes")
Ronan=Developer.new(50000,70000,"Angio","no")
Mary=Developer.new(40000,20000,"RBS","yes")
Murtagh=Developer.new(40000,79000,"BOI","no")
Lowry=Developer.new(97000,35000,"Ulster","yes")

array_bank=[AIB, Angio,RBS,BOI,Ulster]
array_developer=[Johnny,Ronan,Mary,Murtagh,Lowry]

#getting access to each element of array
for i in 0..array_bank.length-1
    declared_bankrupt(array_bank[i].amount_of_loans,
                      array_bank[i].losses,
                      array_bank[i],
                      array_developer[i])
end



