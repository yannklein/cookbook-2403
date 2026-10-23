require_relative "task"
require_relative "repository"
require_relative "controller"
require_relative "view"
require_relative "router"

# App possible actions
# 1. List all the tasks
# 2. Create a task
# 3. Mark a task as done

csv_file_path = "data/tasks.csv"

repository = Repository.new(csv_file_path)
view = View.new

# # Create some task data
# relax = Task.new("take a break")
# work = Task.new("work")
# repository.create(relax)
# repository.create(work)
# # p repository.all
# # #####################

controller = Controller.new(repository, view)
router = Router.new(controller)
router.run