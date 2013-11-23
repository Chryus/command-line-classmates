
require 'awesome_print'
require 'open-uri' #open the file on the internet
require 'nokogiri' #nokogiri magic and methods 

class Scraper
attr_reader :html

	def initialize(url)
		download = open(url)
		@html = Nokogiri::HTML(download)
	end

	#refactoring notes are in separate file scraper_refactoring-notes.rb
	def get_names
	all_the_h3s = html.search("h3")
		all_the_h3s.collect do |h3|
			h3.text
		end
	end

	def get_blogs
		blog_array = []
		html.search("ul.social").each do |anchor|
			if anchor.search(".blog").text == "Blog"
				#shovel the value of href into the blog array
				blog_array << anchor.search(".blog")[0]["href"]
			else
				blog_array << "none"
			end
		end
		ap blog_array
	end

#borrowed from Katie to get the proper selector hierarchy but logic is mine. yay.
	def get_twitters
		twitter_array = []
		#split array into an array of strings separated by a space
		social_array = html.search(".social li:first-child a").text.split(" ")
		#iterate over every string in the array to find a match for "@" in index 0
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

my_scraper = Scraper.new("http://flatironschool-bk.herokuapp.com/")
#puts my_scraper.html
#puts my_scraper.get_names
my_scraper.get_twitters
#puts my_scraper.get_blogs

