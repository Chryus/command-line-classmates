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

#refactor to get rid of hard code
	students = []
	28.times do |i|
		students << Student.new(names[i], twitters[i], blogs[i])
	end

def launch_blog(students, names, blogs)
	ap names
	print "Here's a list of Flatiron students. Enter the number of the blog you'd like to see. "
	id = gets.chomp.to_i
	if id.between?(0,27)
		if blogs[id] == "none"
			print "I'm sorry that student doesn't have a blog. "
		else 
			Launchy.open("#{students[id].blog}")
		end
	else
		print "Please try again. "
	end
end

#launch_blog(students, names, blogs)

def launch_twitter(names, students, twitters)
	ap names
	print "Here's a list of Flatiron students. Enter the number of the twitter you'd like to see. "
	id = gets.chomp.to_i
	if id.between?(0,27)
		if twitters[id] == "none"
			print "I'm sorry that student doesn't have a twitter. "
		else 
			Launchy.open("#{students[id].twitter}")
		end
	else
		print "Please try again. "
	end
end

def launch_random_twitter(students, twitters)
	loops = true
	while loops 
	id = rand(0..27)
		next if twitters[id] == "none"
			Launchy.open("#{students[id].twitter}")
			loops = false
	end
end

def launch_random_blog(students, blogs)
	loops = true
	while loops 
	id = rand(0..27)
		next if blogs[id] == "none"
			Launchy.open("#{students[id].blog}")
			loops = false
	end
end

def ask_user(students, names, twitters, blogs)
	loops = true
	while loops

		print "\n""Hello. To launch a random student's blog, type 'rb'" "\n"
		print "To launch a random student's twitter, type 'rt'" "\n"
		print "To launch a specific student's blog, type 'sb'" "\n"
		print "To launch a specific student's twitter, type 'st'" "\n"
		answer = gets.chomp.downcase
		if answer == "rt" 	
			launch_random_twitter(students, twitters)
			loops = false
		#end
		elsif answer == "rb"
			launch_random_blog(students, blogs)
			loops = false
		#end
		elsif answer == "sb"
			launch_blog(students, names, blogs)	
			loops = false
		#end
		elsif answer == "st"
			launch_blog(students, names, twitters)
			loops = false
		else
		 	print "That isn't an option."
		end
	end
end
ask_user(students, names, twitters, blogs)


# Launchy.open("#{students[launch_blog].blog}")

# Create an app launches a given student's twitter

#Create an app that launches a given student's blog

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



