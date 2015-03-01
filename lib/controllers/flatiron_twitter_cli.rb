class FlatironTwitterCLI
  attr_accessor :on, :students, :instructors #, :staff

  APPROVED_COMMANDS = [:help, :list, :follow, :exit]

  def initialize
    @students = StudentScraper.new.call
    @instructors = InstructorScraper.new.call
    # staff = StaffScraper.new.call
    @on = true
    system("clear")
    Welcome.new.call
  end

  def on?
    @on
  end

  def call              #=> creates simple loop
    while on?           #   where program will run
      self.get_command  #   until @on set to false
    end                 #   see exit method below
  end

  def exit
    puts "Goodbye!"
    @on = false
  end

  def get_command
    puts "\nPlease enter a valid command."
    puts "(Type 'help' to see a list of valid commands)"
    self.command_request
  end

  def command(input)
    if input.slice(0,2) == "t "
      system(input)
    else
      send(input) if command_valid?(input) 
    end
  end

  def command_valid?(input)
    APPROVED_COMMANDS.include?(input.downcase.to_sym)
  end

  def command_request
    self.command(user_input)
  end

  def user_input
    gets.downcase.strip
  end 
             
  def help
    Help.new.call
  end

  def list_students
    puts "\nStudents:"
    @students.each.with_index(1) { |student, i| puts "#{i}. #{student.name} - #{student.twitter}" } 
  end
  
  def list_instructors 
    puts "\nInstructors:"
    @instructors.each.with_index(1) { |instructor, i| puts "#{i}. #{instructor.name} - #{instructor.role} - #{instructor.twitter}" }
  end  
  
  # def list_staff 
  #   @staff.each.with_index(1) { |staff, i| puts "#{i}. #{staff.name} - #{staff.role} : #{staff.twitter}" }
  # end

  def list
    puts "\nList:"
    puts "Please type in one of the options below:"
    puts "'students', 'instructors', 'all'\n"
    input = user_input

    case input
    when "students"
      list_students
    when "instructors"
      list_instructors
    # when "staff"
    #   list_staff
    when "all"
      list_students
      list_instructors
      # list_staff
    else
      puts "Invalid command. Please try again."
    end
  end

  def follow
    puts "\nFollow:"
    puts "Please type in one of the options below:"
    puts "'students', 'instructors', 'all'\n"
    input = user_input

    student_handles = @students.collect { |student| student.twitter }.join(" ")
    instructor_handles = @instructors.collect { |instructor| instructor.twitter }.join(" ")
    # staff_handles = @staff.collect { |staff| staff.twitter }.join(" ")

    case input
    when "students"
      system("t follow #{student_handles}")
      puts "Now following all current Flatiron students."
    when "instructors"
      system("t follow #{instructor_handles}")
    # when "staff"
    #   system("t follow #{staff_handles}")
    #   puts "Now following all current Flatiron staff."
    when "all"
      system("t follow #{student_handles}")
      system("t follow #{instructor_handles}")
      system("t follow @flatironschool")
      # system("t follow #{staff_handles}")
      puts "Now following all current Flatiron students and instructors."
    else
      puts "Invalid command. Please try again."
    end
  end

end