#LEZ build a scraper!
#we're gonna make a class for a scraper, because we have some data & behavior we want to check
#every time we give create a scraper we need an address 
#these are gems to help retrieve data from URL

require 'awesome_print'
require 'open-uri' #open the file on the internet
require 'nokogiri' #nokogiri magic and methods 

class Scraper
attr_reader :html

	def initialize(url)
		download = open(url)
		@html = Nokogiri::HTML(download)
	end

	# #@html is an instance var, while "html" is a method that returns an instance var
	# def get_names
	#  	names_array1 = []
	#  	names_array2 = []
	#  	names = html.search("h3")
	#  	#names.inspect returns massive xml Array so we iterate of it with each
	# 	names.each do |name|
	# 		#=> <h3>Amine Tourki</h3> as xml object
	# 		#convert name to string and push into names array
	# 		name = name.to_s
	# 		names_array1 << name
	# 	end
	# 	names_array1.each do |name_string|
	# 		#<h3>Amine Tourki</h3> as string
	# 		temp = name_string.gsub("<h3>", "    ").gsub("</h3>", "")
	# 		names_array2 << temp
	# 	end
	# 	names_array2
	# end

	#refactored1
	# def get_names
	# all_the_h3s = html.search("h3")
	#		names = []
	# 	all_the_h3s.each do |h3|
	# 		names << h3.text
	# 	end
	# 	names
	# end

	#refactor2 with map or collect
	#don't need a shovel to an array because it's inherent to h3
	def get_names
	all_the_h3s = html.search("h3")
		all_the_h3s.collect do |h3|
			h3.text
		end
	end

	#refactor3 abstracted as a method
	# def get_names(selector_array)
	# 	html.search(selector_array).collect {|element| element.text}
	#	end


	#we refactored this, from using the times method to using the each method because
	#you only call .times on a number
	# def get_blogs
	# 	blog_array = []
	# 	temp = html.search("ul.social")
	# 	temp.each do |anchor|
	# 		if anchor.search(".blog").text == "Blog"
	# 		  blog_array << anchor.search(".blog")[0]["href"]	
	# 	else
	# 		blog_array << "none"
	# 	end
	# end
	# 	blog_array
	# end

	#refactor without storing search yield in a local variable
	def get_blogs
		blog_array = []
		html.search("ul.social").each do |anchor|
			if anchor.search(".blog").text == "Blog"
				blog_array << anchor.search(".blog")[0]["href"]
			else
				blog_array << "none"
			end
		end
		ap blog_array
	end


#index is blog_link, for each index we are setting the value of blog_link["href"] to href
#it's like a a.blog is the key and blog_link[href] gives us the value of the key
# #we set the value to href 
# href = anchor["a.blog"]
# #shovel href local var to empty array
# blog_array << href

#Refactored just like the get_names method we used a technique of pattern recognition
	
	# def get_blogs
	# 	html.search("a.blog").collect { |anchor| anchor["href"].text }
	# end

	# def get_blogs
	# 	html.search("a.blog @href").collect { |anchor| anchor.text }
	# end

	#def get_stuff(selector)
	#   html.search("selector").collect { |element| element.text }
	#end

		#write code to extract url from html element href within class blog
	# 	blog_array << html.search("a.blog")[index]["href"]
	# 	end
	# blog_array
		#within a.blog array index 0, give us the value of href
		#html.search("a.blog")[0]["href"]
		# blog_array.each do |element|
		# 	element[i]

#borrowed from Katie to get the proper selector hierarchy
	def get_twitter
		twitter_array = []
		social_array = html.search("li:first-child a").text.split(" ")
		#if social array does not have class twitter then shovel nil 
		social_array.each do |string|
			if string[0] == "@"
				twitter_array << string
			else
				twitter_array << "none"
			end
		end
		ap twitter_array
	end
	
end

	def get_blogs
		face_back_array = []
		temp = []
		if html.search(".face back: first-child").nil?
			face_back_array << element
		face_back_array.each do |element|
			if element.include?("social") == false
				temp << element
			end
			# if anchor.search(".blog").text == "Blog"
			# anchor.search(".blog")[0]["href"]
			# else
			# "none"
			# end
		end
		temp
	end
	end

#we are moving these to app for separation of responsibilities
my_scraper = Scraper.new("http://flatironschool-bk.herokuapp.com/")
#puts my_scraper.html
#puts my_scraper.get_names
my_scraper.get_twitter
#puts my_scraper.get_blogs





#we call "nokogiri" is a class, "HTML" class method is inside, we pass download to HTML method
#HTML is a method that makes the file #<File:0x007fcb04057dd8> pretty and usable in ruby
# class::class_method
# class::constant
#we store the return value of the method open in the var download
#we keep it local because we're going to use it to create html instance var
#.search is a nokogiri method

#if someone doesn't have a twitter we need to code those conditions in the scraper




