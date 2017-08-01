require 'nokogiri'
require 'open-uri'
require 'open_uri_redirections'
require 'pp'

#   The comments in this program are improvements

def load_uris(uri_array, flag)
	puts "\nURI Array has #{uri_array.size} items"
	uri_array.collect {|uri| load_uri(uri, flag)}.flatten.compact.uniq
end


def load_uri(uri, flag)
   begin
  	  doc = open(uri,:allow_redirections => :safe)
  	  rescue OpenURI::HTTPError => the_error
  	  puts "Error, found bad status code: #{the_error}" 
   end
   if the_error.instance_of?(OpenURI::HTTPError)
	   then puts "...so, we are not doing #{uri}","\n"
   else
   doc = Nokogiri::HTML(open(uri, :allow_redirections => :safe))
   		if flag == "actor" then out = find_films_by_actor(doc) 
   		elsif flag == "film" then out = find_actors_in_film(doc) end
   end
   out
end
 

def find_films_by_actor(doca, out = [])
	puts "**********Entering find_films_by_actor with #{find_name_title(doca)}.**********"
    tables = doca.search('//table[@class="wikitable sortable"]').first       # search the tables in the page
        if tables
            tables = tables.to_s
            all_links = tables.scan(/<td><i><a.+title="(.+?)"/)              # look for the "titles" in the "tables"
            all_links.each do |link|
                out << link end
        end

        if out == []                                                         # if no tables in the page, the page should not be an actor's page
           puts "IT'S NOT AN ACTOR'S PAGE. \n"
        end
        
        puts "MOVIES LIST:"                                                  # print the results and numbers of results
        puts out.uniq.collect {|link| link}
        puts "THE NUMBER OF MOVIE:"
        puts out.length,"\n"
end



def find_name_title(doca)
    if !doca.nil?
      then title = doca.search("//title").inner_text
		   title.gsub(" - Wikipedia, the free encyclopedia", "")
    end
end

#****************************   DE DATA   *****************************   
uri1 = "https://en.wikipedia.org/wiki/Mark_Keane"				          #one that isnt an actor/film
uri2 = "http://en.wikipedia.org/wiki/Close_Encounters_of_the_Third_Kind"  #one that is a film
uri3 = "http://en.wikipedia.org/wiki/Melinda_Dillon"					  #one that is an actor
uri4 = "http://en.wikipedia.org/wiki/Flubbeo"							  #one that's not a valid wiki page
uri5 = "https://en.wikipedia.org/wiki/Kevin_Bacon"			              #one that's not a valid wiki page
uri6 = "http://en.wikipedia.org/wiki/Richard_Dreyfuss"					  #another actor
uri7 = "http://en.wikipedia.org/wiki/Bound_for_Glory_(film)"			  #another film
uri8 = "http://en.wikipedia.org/wiki/The_Man_Who_Loved_Women_(film)"      #yet another film
#****************************   DE DATA   *****************************   


actor_uris = [uri1,uri3,uri4,uri5,uri6]
uri_filmography=[]

actor_uris.each do |each|                                                 # If the page is not avaliable, create its "filmography" uri
    uri_filmography<<each+"_filmography"
end

puts "The program starts"
puts load_uris(actor_uris, "actor")                                       # search the normal page
puts "****************************   uri_filmography   *************************"
load_uris(uri_filmography, "actor")                                     # search the "filmography" page
