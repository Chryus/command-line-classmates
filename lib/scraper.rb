#LEZ build a scraper!
#we're gonna make a class for a scraper, becaus we have some data and some behavior
#every time we give create a scraper we need an address 
#these are gems to help retrieve data from URL
require 'open-uri' #open the file on the internet
require 'nokogiri' #

class Scraper
attr_reader :html

	def initialize(url)
		download = open(url)
		@html = Nokogiri::HTML(download)
	end

	#@html is an instance var, while "html" is a method that returns an instance var
	 def get_names
	 		names_array1 = []
	 		names_array2 = []
	 		names = html.search("h3")
			names.each do |name|
				#=> <h3>Amine Tourki</h3> as xml object
				#convert name to string and push into names array
				name = name.to_s
				names_array1 << name
			end
			names_array1.each do |name_string|
				#<h3>Amine Tourki</h3> as string
				temp = name_string.gsub("<h3>", "    ").gsub("</h3>", "")
				names_array2 << temp
			end
		names_array2
	 end

	#we refactored this, from using the times method to using the each method because
	#you only call .times on a number
	def get_blogs
		blog_array = []
		temp = (html.search("a.blog"))
		temp.each do |blog_link|
			#index is blog_link, for each index we are setting the value of blog_link["href"] to href
			href = blog_link["href"]
			#shovel href loval var to empty array
			blog_array << href
		end
		blog_array
	end

		#write code to extract url from html element href within class blog
	# 	blog_array << html.search("a.blog")[index]["href"]
	# 	end
	# blog_array
		#within a.blog array index 0, give us the value of href
		#html.search("a.blog")[0]["href"]
		# blog_array.each do |element|
		# 	element[i]
	

	def get_twitter
		new_array = []
		twitter_handle = html.search("li a").text.split(" ")
			twitter_handle.each do |element|
				if element[0] == "@"
					new_array << element
				end
			end
		new_array
	end
end


#we are moving these to app for separation of responsibilities
#my_scraper = Scraper.new("http://flatironschool-bk.herokuapp.com/")
#puts my_scraper.html
#puts my_scraper.get_names
#puts my_scraper.get_twitter
#puts my_scraper.get_blogs




	# def get_names
	# 	names = html.search((".blog")
	# 	all_the_h3s.collect do |h3|
	# 		h3['href']
	# 	end
	# 	all_the_h3s
	# end
#we call "nokogiri" is a class, "HTML" class method is inside, we pass download to HTML method
#HTML is a method that makes the file #<File:0x007fcb04057dd8> pretty and usable in ruby
# class::class_method
# class::constant
#we store the return value of the method open in the var download
#we keep it local because we're going to use it to create html instance var
#.search is a nokogiri method

#if someone doesn't have a twitter we need to code those conditions in the scraper

