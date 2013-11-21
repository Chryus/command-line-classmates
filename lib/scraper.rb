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
	def get_students_names
		names = html.search("h3").text.split
	end

	def get_blog_url
		blog_url = html.search(".blog:href")
	end

	def get_twitter_handle
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

my_scraper = Scraper.new("http://flatironschool-bk.herokuapp.com/")
#puts my_scraper.html
#puts my_scraper.get_students_names
#puts my_scraper.get_twitter_handle
puts my_scraper.get_blog_url


#we call "nokogiri" is a class, "HTML" class method is inside, we pass download to HTML method
#HTML is a method that makes the file #<File:0x007fcb04057dd8> pretty and usable in ruby
# class::class_method
# class::constant
#we store the return value of the method open in the var download
#we keep it local because we're going to use it to create html instance var
#.search is a nokogiri method

