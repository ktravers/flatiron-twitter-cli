class Help

  def call
    puts ""
    puts "----------------------------- Valid Commands -----------------------------"
    puts ""
    puts " list            :  type `list` then enter one of the subcommands below "
    puts " -- students     :  displays list of student names and @handles"
    puts " -- instructors  :  displays list of instructor names and @handles"
    # puts " -- staff        :  displays list of staff names and @handles"
    puts " -- all          :  displays all current students and instructors"
    puts ""
    puts " follow          :  type `follow` then enter one of the subcommands below "
    puts " -- students     :  follows all current students"
    puts " -- instructors  :  follows all current instructors"
    # puts " -- staff        :  follows all current students"
    puts " -- all          :  follows all current students and instructors"
    puts ""
    puts " t commands      :  type `t <command>` to run any valid t gem command"
    puts ""
    puts " -- help         :  displays this help menu"
    puts " -- exit         :  exits this program"
    puts ""
    puts "--------------------------------------------------------------------------"
    puts ""
  end

end