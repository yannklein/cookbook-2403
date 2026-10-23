class Router
  def initialize(controller)
    @controller = controller
  end

  def run 
    puts "Welcome to our TODO list 🚀"
    puts "---------------------------"
    
    loop do
      puts
      puts "What do you want to do?"
      puts "1. Display the tasks"
      puts "2. Add a task"
      puts "3. Mark a task as done"
      choice = gets.chomp.to_i

      case choice
        when 1 then @controller.list
        when 2 then @controller.add
        when 3 then @controller.mark_as_done
        else  "You're not serious! 🧐"
      end
    end
  end
end