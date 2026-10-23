class View

  def display_tasks(tasks)
    tasks.each_with_index do |task, index|
      mark = task.done? ? "X" : " "
      puts "#{index + 1}. [#{mark}] #{task.description}"
    end
  end

  def ask_for_description
    puts "What task do you want to add?"
    gets.chomp
  end

  def ask_for_index
    puts "What task do you want to mark?"
    gets.chomp
  end

end