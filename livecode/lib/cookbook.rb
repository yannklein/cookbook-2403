require "csv"

class Cookbook
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    load_csv
  end

  # CRUD operation on recipe
  
  # READ
  def all
    @recipes
  end

  # CREATE
  def create(new_recipe)
    @recipes << new_recipe
    save_csv
  end

  # DELETE
  def destroy(recipe_index)
    @recipes.delete_at(recipe_index)
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path) do |row|
      # row => ["pizza", "good stuff"]
      recipe = Recipe.new(row[0], row[1])
      @recipes << recipe
    end
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      @recipes.each do |recipe|
        # recipe => instance
        # csv --> ["name", "description"]
        csv << [recipe.name, recipe.description]
      end
    end
  end
end