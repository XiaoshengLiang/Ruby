# The method is for judging whether a email is a fraud email
# There are ten emails are in the array csv_file_name, judge each of them by using loop
# A key words list is identified, read each emails and count the number of keywords showed in email.

require 'csv'

def search_keywords(file_name)
    result=0
    i=1
    message=File.read(file_name)
    list_keywords=Array["security","account","online","safety"]      #  the list of keywords
    list_keywords.each do |keyword|       #   search the keyword in each email
        fi=Regexp.new(keyword)
        status=message=~fi
        if status.class==Fixnum
            i+=1
        end
    end
#        the result of judgement based on the number of keywords existed in email.
        if i<=2
            puts "This email is a regular email."
        else
            puts "This email is a fraud email."
        end
end


#   10 files in the folder
csv_file_name=Array["0.txt","1.txt","2.txt","3.txt","4.txt","5.txt","6.txt","7.txt","8.txt","9.txt"]

#    search each file and invoke the "reader" method
j=0
num=10
while j<num do
    puts csv_file_name[j]
    puts search_keywords(csv_file_name[j])
    j+=1
end
#reader