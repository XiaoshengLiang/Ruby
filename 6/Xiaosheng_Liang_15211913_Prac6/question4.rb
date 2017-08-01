# There is a class called Book. It contains two public method a private method as well as a protectd method.
# the private method is invoked in public method "public_details" and protectd method invoked by using "self"

class Book
    attr_accessor :name, :publish_time, :author, :status, :owner
    def initialize (name,publish_time,author,status,owner)
        @name=name
        @publish_time=publish_time
        @author=author
        @status=status
        @owner=owner
    end

#    the public method
    def old_book?
        @publish_time=publish_time
        if 2016-publish_time>=100
            puts "This is an old book"
            else puts "This is a new book"
        end
    end

#    the public method
    def print_details
        if @status=="borrowed"
            print_owner         #invoke the private method
        else
        self.show_avaliable     #invoke the protected method
        end
    end
    
    def print_owner
        print "The book has been borrowed. The owner is ",@owner,"\n"
    end
    
    def show_avaliable
        puts "This book is avaliable"
    end
    
    public :old_book?, :print_details
    private :print_owner
    protected :show_avaliable
    
end

book1 = Book.new("Snow white", 1812, "Brothers Grimm", "avaliable","none")
book2 = Book.new("Cinerella", 1697,"Brothers Grimm","borrowed","Mary")

puts book1.name
book1.old_book?
book1.print_details
puts "******************"
puts book2.name
book2.old_book?
book2.print_details