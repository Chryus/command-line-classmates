# tests for student class, you can instantiate a student and it will have a 
# name, twitter handle, blog

require '../lib/student.rb'
chris = Student.new("Chris", "@superxtanza", "www.echo.com")
describe "Student, #initialize" do
	  
	  it "takes a student and returns a name" do
	  	expect(chris.name).to eq("Chris")
	  end

	  it "take a student and returns a twitter handle" do
	  	expect(chris.twitter).to eq("@superxtanza")
	  end

	end
	