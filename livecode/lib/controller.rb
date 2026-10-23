require_relative "view"
require_relative "recipe"

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    # 1. retrieve the recipes (from @cookbook)
    recipes = @cookbook.all
    # 2. display recipes (to @view)
    @view.display_list(recipes)
  end

  def add
    # Ask for a name (view)
    name = @view.ask_for("name")
    # Ask for description (view)
    description = @view.ask_for("description")
    # Create a recipe out of them
    new_recipe = Recipe.new(name, description)
    # Store it into the cookbook
    @cookbook.create(new_recipe)
  end

  def remove
    # Show the recipe list
    list
    # Ask for a index to delete (view)
    index = @view.ask_for("index").to_i - 1
    # Delete in the cookbook
    @cookbook.destroy(index)
  end
end