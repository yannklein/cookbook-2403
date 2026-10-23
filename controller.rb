require_relative "task"

class Controller
  # Goal: perform the user actions

  def initialize(repository, view)
    @repository = repository
    @view = view
  end

  # List all the tasks
  def list
    # 1. Ask the repo to give tasks
    tasks = @repository.all
    # 2. Ask the view to display the tasks
    @view.display_tasks(tasks)
  end

  # Create a task
  def add
    # 1. Ask the view, to ask the user what task?
    description = @view.ask_for_description
    # 2. Create a task
    new_task = Task.new(description)
    # 3. Ask the repo to store it
    @repository.create(new_task)
  end

  # Mark a task as done
  def mark_as_done
    # 1. Ask the repo to give the tasks
    tasks = @repository.all
    # 2. Ask the view to display the task
    @view.display_tasks(tasks)
    # 3. Ask the view to ask the user to select a task index
    index = @view.ask_for_index.to_i - 1
    # 4. Retrieve the selected task from the tasks
    task_to_mark = tasks[index]
    # 5. Mark it as done
    task_to_mark.mark_as_done
  end
end