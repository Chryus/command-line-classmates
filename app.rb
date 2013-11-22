#app.rb is the place where we can do this work
#with both scraper and student 
#we use the scraper to get our data and store it in our student objects

require './lib/scraper.rb'
require './lib/student.rb'


#here we are setting local variables

student_scraper = Scraper.new("http://flatironschool-bk.herokuapp.com/")
names = student_scraper.get_names
twitters = student_scraper.get_twitter
blogs = student_scraper.get_blogs

#here we have the number of students that we are 
#iterating over to instantiate all of them
students = []
28.times do |i|
	students << Student.new(names[i], twitters[i], blogs[i])
end
students.each do |student|
	puts student.blog
end




#puts students

# 1. make new scraper

# 2. get the student names form the scraper

# 3. get the blogs

# 4. get the twitter

#5. make a new student object for each person

#we instantiate all of our students in the app

#Chris