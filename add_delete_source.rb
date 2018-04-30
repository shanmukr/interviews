print "Choose the below options : \n\t\t\tRead\n\t\t\tAdd\n\t\t\tDelete\n"
input = gets.strip.downcase

class AddAndDelete
  
  def read()
    resume = File.open("shanmukhareddy_resume.json", "r")
      lines = resume.readlines
      for i in lines
        if( i=~ /"(.*)".*\s+"(.*)"/ )
          print $1, " : ""\n"
          $2.split(',').each do |f|
            print "\t\t", f.strip(), "\n"
          end
        end
    	 end
    resume.close
  end

  def add_delete(input, option, data, pr_name="a", pr_desc="a", pr_techs="a", pr_resp="a", pr_flat="a")
    resume = File.open("shanmukhareddy_resume.json", "r")
      lines = resume.readlines
      write_data = File.open("shanmukhareddy_resume.json", "w")
    		for i in lines
          if option == "project" && input == "add"
            if i =~ /("Projects".*)/
              write_data.write("#{$1}\n")
              write_data.write("{\n\"Project Name\" : \"#{pr_name}\",\n\"Description\" : \"#{pr_desc}\",\n\"Responsibilities\" : \"#{pr_resp}\",\n\"Platform\" : \"#{pr_flat}\",\n\"Technology\" : \"#{pr_techs}\"\n},\n")
            else
              write_data.write(i)
            end
          elsif option == "project" && input == "delete"
            if i =~ /(\"Project Name\" : \"#{pr_name}\",\n)/i || i =~ /(\"Description\" : \"#{pr_desc}\",\n)/i || i =~ /(\"Responsibilities\" : \"#{pr_resp}\",\n)/i || i=~ /(\"Platform\" : \"#{pr_flat}\",\n)/i || i =~ /(\"Technology\" : \"#{pr_techs}\")/i
              write_data.write("#{$1.gsub($1, "")}")
            else
              write_data.write(i)
            end
          else
            if i =~ /"#{option.capitalize}".*\s+"(.*)",/i
              input == "add" ? write_data.write("\"#{option.capitalize}\" : \"#{$1}, #{data}\",\n") : write_data.write("\"#{option.capitalize}\" : \"#{$1.gsub(data, '')}\",\n")
            else
              write_data.write(i)
            end
          end
        end
      write_data.close
      res = input == "add" ? "added" : "deleted"
      data = option == "project" ? option.capitalize : data
      print "successfully #{res} #{data}.\n"
    resume.close
  end

end

obj = AddAndDelete.new
if input == "read" 
  obj.read()
elsif input == "add"
  print "Choose the below options : \n\t\t\tEmail\n\t\t\tTechnologies\n\t\t\tPhone\n\t\t\tProject\n"
  option = gets.strip.downcase
  if option == "email"
    print "Enter valid Mail Id : "
    email = gets.strip
    if email =~ /.*@\w+.com/
      obj.add_delete(input, option, email)
    else
      print "Given email '#{email}' is not valid. Please enter valid email\n"
    end
  elsif option == "phone"
    print "Enter valid Phone Number : "
    phone = gets.strip
    if phone =~ /\d[10]/
      obj.add_delete(input, option, phone)
    else
      print "Given Phone Number '#{phone}' is not valid. Please enter valid Phone number\n"
    end
  elsif option == "technologies"
    print "Enter Technologies : "
    techs = gets.strip
    obj.add_delete(input, option, techs)
  elsif option == "project"
    print "Enter the Project Name : "
    pr_name = gets.strip
    print "Enter the Project Desription : "
    pr_desc = gets.strip
    print "Enter the Technologies used in the project : "
    pr_techs = gets.strip
    print "Enter the yours responsibilities : "
    pr_resp = gets.strip
    print "Enter the Flatform : "
  		pr_flat = gets.strip
    unless pr_name.empty? || pr_desc.empty? || pr_techs.empty? || pr_resp.empty? || pr_flat.empty?
      obj.add_delete(input, option, "", pr_name, pr_desc, pr_techs, pr_resp, pr_flat)
    else
      print "Please enter the all options\n"
    end
  else
    print "Choose the valid options\n"
  end
else
  print "Choose the valid options\n"
end
