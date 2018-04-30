class AddDelete

  def data_split(data)
	  array = []
	  for i in data.split(',')
		  array << i.strip
		end
		return array
	end

  def get_data
    my_data = Hash.new
    my_data["Projects"] = {}
    resume = File.open("shanmukhareddy_resume.json", "r")
      lines = resume.readlines
      for i in lines
        if i =~ /"Project\s+Name".*\s+"(.*)".*/i
          project_name = $1
					my_data["Projects"][project_name] = {}
        elsif i =~ /"(Description)".*\s+"(.*)".*/i
					my_data["Projects"][project_name][$1] = data_split($2)
        elsif i =~ /"(Responsibilities)".*\s+"(.*)".*/i
					my_data["Projects"][project_name][$1] = data_split($2)
        elsif i =~ /"(Platform)".*\s+"(.*)".*/i
					my_data["Projects"][project_name][$1] = data_split($2)
        elsif i =~ /"(Technology)".*\s+"(.*)".*/i
					my_data["Projects"][project_name][$1] = data_split($2)
        elsif i =~ /"(.*)".*\s+"(.*)"/
          my_data[$1] = data_split($2)
        end
      end
    resume.close
    return my_data
  end

  def print_data(hash)
    hash.keys.each do |f|
		  print f, " : \n"
			if hash[f].is_a?(Hash)
			  hash[f].keys.each do |p|
				  print p, " : \n"
				 	hash[f][p].keys.each do |d|
				    print "\t", d, " : \n"
						for j in ( 0 ... hash[f][p][d].size )
						  print "\t\t", hash[f][p][d][j], "\n"
						end
					end
				end
			elsif hash[f].is_a?(Array)
			  for i in ( 0 ... hash[f].size)
			    print "\t\t\t\t\t", hash[f][i], "\n"
			  end
			end
		end
	end

	def read
	  resume_data = get_data()
	  print_data(resume_data)
	end

	def add(data, option)
	  resume_data = get_data()
    resume_data[option.capitalize] << data
	  print_data(resume_data)
	end

  def add_project(pr_name, pr_desc, pr_tech, pr_resp, pr_plat)
	  resume_data = get_data()
	  resume_data['Projects'][pr_name] = {"Description" => pr_desc, "Responsibilites" => pr_resp, "Technology" => pr_tech, "Platform" => pr_plat}
	  print_data(resume_data)
	end

	def delete(data, option)
	  resume_data = get_data()
    option == "project" ? resume_data['Projects'].delete(data) : resume_data[option.capitalize].delete(data)
	  print_data(resume_data)
	end

  def check_for_validation(option, data) 
  	if option == "phone"
  	  if data =~ /\d[10]/
  		  return true
  		end
    elsif option == 'email'
      if data =~ /.*@\w+.com/
  		  return true
  	  end
  	end
  end

end


obj = AddDelete.new

print "Choose the below options : \n\t\t\tRead\n\t\t\tAdd\n\t\t\tDelete\n\t\t\tExit\n"
input = gets.strip.downcase

if input == "exit"
  exit
elsif input == "read"
  obj.read
elsif input == "add" || input == "delete"
  print "Choose the below options : \n\t\t\tEmail\n\t\t\tTechnologies\n\t\t\tPhone\n\t\t\tProject\n"
  option = gets.strip.downcase
	if option == "phone"
    print "Enter valid Phone Number : "
    data = gets.strip
		if obj.check_for_validation(option, data) == true
			input == "add" ? obj.add(data, option) : obj.delete( data, option)
		else
		  print "Given Phone Number #{data} is not valid.\n"
    end
	elsif option == "email"
    print "Enter valid Email Id : "
    data = gets.strip
		if obj.check_for_validation(option, data) == true
			input == "add" ? obj.add(data, option) : obj.delete( data, option)
		else
		  print "Given Email id #{data} is not valid.\n"
    end
	elsif option == "technologies"
    print "Enter technology : "
    data = gets.strip
	  input == "add" ? obj.add(data, option) : obj.delete( data, option)
	elsif option == "project"
		print "Project Name : "
		data = gets.strip
    if input == "delete"
      obj.delete(data, option)
	  elsif input == "add"
		  print "Project Name : "
			pr_name = gets.strip
		  print "Project Description : "
			pr_desc = gets.strip
		  print "Responsibilites : "
			pr_resp = gets.strip
		  print "Technology : "
			pr_tech = gets.strip
		  print "Platform : "
			pr_plat = gets.strip
			obj.add_project(pr_name, pr_desc, pr_tech, pr_resp, pr_plat)
    end
	end
else
  print "Choose the valid option #{input}\n"
end
