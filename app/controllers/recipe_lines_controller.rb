class RecipeLinesController < ApplicationController
  def index
    matching_recipe_lines = RecipeLine.all

    @list_of_recipe_lines = matching_recipe_lines.order({ :created_at => :desc })

    render({ :template => "recipe_line_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_recipe_lines = RecipeLine.where({ :id => the_id })

    @the_recipe_line = matching_recipe_lines.at(0)

    render({ :template => "recipe_line_templates/show" })
  end

  def create

    the_recipe_line = RecipeLine.new
    the_recipe_line.ingredient_id = params.fetch("query_ingredient_id")
    the_recipe_line.recipe_id = params.fetch("query_recipe_id")
    the_recipe_line.quantity = params.fetch("query_quantity")
    the_recipe_line.quantity_unit = params.fetch("query_quantity_unit")
    the_recipe_line.notes = params.fetch("query_notes")

    if the_recipe_line.valid?
      the_recipe_line.save
      redirect_to("/recipes/#{the_recipe_line.recipe_id}", { :notice => "Recipe line created successfully." })
    else
      redirect_to("/recipes/#{the_recipe_line.recipe_id}", { :alert => the_recipe_line.errors.full_messages.to_sentence })
    end
  end

  def edit_form
    the_id = params.fetch("path_id")
    matching_lines = RecipeLine.where({ :id => the_id })
    @the_recipe_line = matching_lines.at(0)

    matchiing_recipes = Recipe.where({ :id => @the_recipe_line.recipe_id })
    @the_recipe = matchiing_recipes.at(0)

    matchiing_ingredients = Ingredient.where({ :id => @the_recipe_line.ingredient_id })
    @the_ingredient = matchiing_ingredients.at(0)

    render({ :template => "recipe_line_templates/edit_form" })
  end

  def update
    the_id = params.fetch("path_id")
    the_recipe_line = RecipeLine.where({ :id => the_id }).at(0)

    the_recipe_line.ingredient_id = params.fetch("query_ingredient_id")
    the_recipe_line.recipe_id = params.fetch("query_recipe_id")
    the_recipe_line.quantity = params.fetch("query_quantity")
    the_recipe_line.quantity_unit = params.fetch("query_quantity_unit")
    the_recipe_line.notes = params.fetch("query_notes")

    if the_recipe_line.valid?
      the_recipe_line.save
      redirect_to("/recipes/#{the_recipe_line.recipe_id}", { :notice => "Recipe line updated successfully." } )
    else
      redirect_to("/recipes/#{the_recipe_line.recipe_id}", { :alert => the_recipe_line.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_recipe_line = RecipeLine.where({ :id => the_id }).at(0)

    the_recipe_line.destroy

    redirect_to("/recipes/#{the_recipe_line.recipe_id}", { :notice => "Recipe line deleted successfully." } )
  end
end
