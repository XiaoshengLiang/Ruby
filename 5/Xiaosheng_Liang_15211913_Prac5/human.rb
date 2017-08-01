# Human is the super class
class Human
    attr_accessor :name, :age, :sex, :height, :status
    def initialize(name,age,sex,height,status)
        @name=name
        @age=age
        @sex=sex
        @status=status
        @height=height
    end

#   The method decides whether a person is a student, then invoke the method grow_up and get_height
    def is_work?
        if @status=="study"
            puts "he is a student."
            false
        else puts "he is working"
            true
        end
    end

    def grow_up
        @age=age+1
        get_height
        print "After a year, the age is ",age,".  The height is ",height,"\n"
        is_work?
    end
    
    def get_height
        @height=height+1
    end
end


#   Student is the subclass of Human
    class Student < Human
        attr_accessor :grades, :level
        def initialize (name,age,sex,height,status,grades)
            @name=name
            @age=age
            @sex=sex
            @height=height
            @grades=grades
        end
        
#       The is dividing the grades into four levels based on the marks
        def student_level
            @grades=grades
            if grades<40
                level="D"
            elsif grades>=40 && @grades<60
                level="C"
            elsif grades>=60 && @grades<80
                level="B"
            else level="A"
            end
            print "The level is ",level,"\n"
        end
    end


#   Master is a subclass of Student
    class Master < Student
#       The method means to tranform the status of student to "doing master"
        def change_status
            @status="doing master"
            print "Now the status is ",@status,"\n"
        end
    end


person=Human.new("Mary",23,"female",175,"study")
student=Student.new("John",25,"male",168,"study",78)
master=Master.new("Bob",27,"male",189,"study",55)

puts "****Stage 1****"
p person
p student
p master
print "\n"

puts "****Stage 2 (apply up)****"
print person.grow_up
print "\n"
print student.student_level
print student.grow_up
print "\n"
print master.change_status
print master.grow_up
print master.student_level
print "\n"

puts "****Stage 3 (apply down)****"
print person.student_level
print person.change_status
print person.change_status
