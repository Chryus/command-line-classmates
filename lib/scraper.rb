require 'awesome_print'
require 'open-uri' #open the file on the internet
require 'nokogiri' #nokogiri magic and methods 

#refactoring notes are in separate file scraper_refactoring-notes.rb

class Scraper
attr_reader :html

	def initialize(url)
		download = open(url)
		@html = Nokogiri::HTML(download)
	end

	def get_names
		html.search("h3").collect { |h3| h3.text }
	end

	#refactored with collect!
	def get_blogs
		html.search(".back").collect do |elements|
			if elements.search(".blog").text == "Blog"
				elements.search(".blog")[0]["href"]
			else
				"none"
			end
		end
	end

	def get_twitters
		html.search(".back").collect do |elements|
			if elements.search(".twitter").text.include?("@")
				elements.search(".twitter")[0]["href"]
			else
				"none"
			end
		end
	end

# def get_twitters
# 	twitter_array = html.search("li:first-child a").text.split(" ")
# 	twitter_array.collect do |string|
# 		if string[0] == "@"
# 			string
# 		else
# 			"none"
# 		end
# 	end
# end

end

#my_scraper = Scraper.new("http://flatironschool-bk.herokuapp.com/")
#puts my_scraper.html
#puts my_scraper.get_names
#ap my_scraper.get_twitters
#ap my_scraper.get_blogs

