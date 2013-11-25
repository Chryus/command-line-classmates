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
	

def launch_blog(students, blogs)
	ap students
	id = -1
	until id.between?(0,27) && id.class == Fixnum
		print "Here is a list of Flatiron geniuses. Whose blog would you like to see? (enter the number.) "
		id = gets.chomp.to_i
		if id.between?(0,27) == false
			print "Nope. I said enter a the student's number. "		
		elsif blogs[id] == "none"
			print "I'm sorry that student doesn't have a blog. "
			id = -1
		else
			Launchy.open("#{students[id].blog}")
		end
	end
end

#launch_blog(students, twitters)

def launch_twitter(students, twitters)
	ap students
	id = -1
	until id.between?(0,27) && id.class == Fixnum
		print "Here is a list of Flatiron geniuses. Whose twitter would you like to see? (enter the number.) "
		id = gets.chomp.to_i
		if id.between?(0,27) == false
			print "Nope. I said enter a the student's number. "		
		elsif twitters[id] == "none"
			print "I'm sorry, that student doesn't have a twitter. "
			id = -1
		else
			Launchy.open("#{students[id].twitter}")
		end
	end
end

launch_twitter(students, twitters)

#Launchy.open("#{students[launch_twitter].twitter}")

def launch_random_twitter(students, twitters)
	loops = true
	while loops 
	id = rand(0..27)
		next if twitters[id] == "none"
			Launchy.open("#{students[id].twitter}")
			loops = false
	end
end

#launch_random_twitter(students, twitters)

def launch_random_blog(students, blogs)
	loops = true
	while loops 
	id = rand(0..27)
		next if blogs[id] == "none"
			Launchy.open("#{students[id].blog}")
			loops = false
	end
end

#launch_random_blog(students, blogs)

# Launchy.open("#{students[launch_blog].blog}")

# Create an app launches a given student's twitter

#future refactoring notes: 
# students.collect! do |student|
# if student.blog == "none"
# student.name + ": sorry this student's blog is lost in the matrix."
# else
# student.name

# def format_students(students)
#   students.collect! do |student|
# 		if student.blog == "none"
#   		student.name + ": sorry this student's blog is lost in the matrix."
# 		else
# 	 		student.name
# 		end
# 	end
# 	students
# end
# ap format_students(students)

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



