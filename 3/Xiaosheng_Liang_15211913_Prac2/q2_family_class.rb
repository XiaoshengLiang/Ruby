class FamilyMember
    attr_accessor :name, :sex, :age, :status, :job
    
    def initialize(name,sex,age,status,job)
        @name=name
        @sex=sex
        @age=age
        @status=status
        @job=job
    end
    
    def parent?
        age_of_pers=@age
        sex_of_pers=@sex
        if age_of_pers>=25
            if sex_of_pers=="male"
                then print @name," is the father.","\n"
                    true
            else print @name," is the mother.","\n"
                true
            end
        else print @name," is not the parent.","\n"
            false
        end
    end
        
    def child?
        age_of_pers=@age
        sex_of_pers=@sex
        if age_of_pers<25
            if sex_of_pers=="male"
                then print @name," is the son.","\n"
                    true
            else print @name," is the daughter.","\n'"
                true
            end
        else print @name," is not the child.","\n"
            false
        end
    end
    
end
    
fm1=FamilyMember.new("Jane","female",50,"mother","housewife")
fm2=FamilyMember.new("Bob","male",52,"mother","doctor")
fm3=FamilyMember.new("Mary","female",22,"daughter","teacher")
fm4=FamilyMember.new("Mike","male",19,"son","student")
fm5=FamilyMember.new("Poppy","female",15,"daughter","student")
print "**************** Is the family member the parent or child? ****************\n"
fm1.parent?
fm1.child?
fm2.parent?
fm2.child?
fm3.parent?
fm3.child?
fm4.parent?
fm4.child?
fm5.parent?
fm5.child?

print "**************** search the name and status of family member ****************\n"
listy=[fm1,fm2,fm3,fm4,fm5]
listy.each{|i| print i.name," is the ",i.status,".\n"}
listy.each do |i|
     print i.name," is the ",i.status,".\n"
    end

