class ListLinesController < ApplicationController
  def index
    matching_list_lines = ListLine.all

    @list_of_list_lines = matching_list_lines.order({ :created_at => :desc })

    render({ :template => "list_line_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_list_lines = ListLine.where({ :id => the_id })

    @the_list_line = matching_list_lines.at(0)

    render({ :template => "list_line_templates/show" })
  end

  def create
    the_list_line = ListLine.new
    the_list_line.ingredient_id = params.fetch("query_ingredient_id")
    the_list_line.list_id = params.fetch("query_list_id")
    the_list_line.quantity = params.fetch("query_quantity")
    the_list_line.quantity_unit = params.fetch("query_quantity_unit")
    the_list_line.notes = params.fetch("query_notes")
    the_list_line.in_stock_flag = params.fetch("query_in_stock_flag")
    the_list_line.in_cart_flag = params.fetch("query_in_cart_flag")

    if the_list_line.valid?
      the_list_line.save
      redirect_to("/list_lines", { :notice => "List line created successfully." })
    else
      redirect_to("/list_lines", { :alert => the_list_line.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_list_line = ListLine.where({ :id => the_id }).at(0)

    the_list_line.ingredient_id = params.fetch("query_ingredient_id")
    the_list_line.list_id = params.fetch("query_list_id")
    the_list_line.quantity = params.fetch("query_quantity")
    the_list_line.quantity_unit = params.fetch("query_quantity_unit")
    the_list_line.notes = params.fetch("query_notes")
    the_list_line.in_stock_flag = params.fetch("query_in_stock_flag")
    the_list_line.in_cart_flag = params.fetch("query_in_cart_flag")

    if the_list_line.valid?
      the_list_line.save
      redirect_to("/list_lines/#{the_list_line.id}", { :notice => "List line updated successfully." } )
    else
      redirect_to("/list_lines/#{the_list_line.id}", { :alert => the_list_line.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_list_line = ListLine.where({ :id => the_id }).at(0)

    the_list_line.destroy

    redirect_to("/list_lines", { :notice => "List line deleted successfully." } )
  end
end
