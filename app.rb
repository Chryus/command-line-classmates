#we instantiate all of our students in the app
#we use the scraper to get our data and store it in our student objects

require './lib/scraper.rb'
require './lib/student.rb'
require 'launchy'
require 'awesome_print'

#set local variables for accesssing names, twitters & blogs

student_scraper = Scraper.new("http://flatironschool-bk.herokuapp.com/")
names = student_scraper.get_names
twitters = student_scraper.get_twitters
blogs = student_scraper.get_blogs

students = []
28.times do |i|
	students << Student.new(names[i], twitters[i], blogs[i])
end

ap names.gsub(',' ' ')

def get_name
	name = 0
	until name.between?(1,27) && name.class == Fixnum
		print "Here is a list of Flatiron geniuses. Whose blog would you like to see? (enter the number.) "
		name = gets.chomp.to_i
		if name.between?(1,27) == false
			print "No I said enter a the student's number. "		
		end
	end
	name - 2
end

Launchy.open("#{students[get_name].blog}")


#Launchy.open("#{students[2].blog}")

#Create an app that launches a given student's blog
#1. show the user the list of name
# if name doesn’t exist tell the user sorry, that name doesn’t exist
# ask the user until they get a name right
# store the answer in a local var
# use student name to find blog address
# tell launch to launch blog


# using your student.rb and scraper.rb, write a command line app that gives the user the opportunity to:
#  - launches a given student's twitter
#  - launches a given student's blog
#  - launches a random student's twitter
#  - launches a random student's blog


#Launchy.open("#{students[1].blog}")
#Launchy.open("#{blogs.sample}")



