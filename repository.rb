require "csv"
require_relative "task"

class Repository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @tasks = []
    load_csv
  end

  # Mission of the repo: perform CRUD
  
  # CREATE (store a task)
  def create(new_task)
    @tasks << new_task
    save_csv
  end

  # READ (all the tasks)
  def all
    @tasks
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path) do |row|
      # In the CSV: `Coding,false``
      # row -> ["Coding", "false"]
      new_task = Task.new(row[0])
      @tasks << new_task
    end
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      @tasks.each do |task|
        csv << [task.description, task.done?]
      end
    end
  end
end