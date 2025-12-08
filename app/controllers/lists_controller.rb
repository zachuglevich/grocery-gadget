class ListsController < ApplicationController
  def index
    matching_lists = List.all

    @list_of_lists = matching_lists.order({ :created_at => :desc })

    render({ :template => "list_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_lists = List.where({ :id => the_id })

    @the_list = matching_lists.at(0)

    render({ :template => "list_templates/show" })
  end

  def create
    the_list = List.new
    the_list.name = params.fetch("query_name")
    the_list.description = params.fetch("query_description")
    #Set the owner on the sever side
    the_list.user_id = current_user.id
    #the_list.list_lines_count = params.fetch("query_list_lines_count")

    if the_list.valid?
      the_list.save
      redirect_to("/lists", { :notice => "List created successfully." })
    else
      redirect_to("/lists", { :alert => the_list.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_list = List.where({ :id => the_id }).at(0)

    the_list.name = params.fetch("query_name")
    the_list.description = params.fetch("query_description")
    the_list.user_id = params.fetch("query_user_id")
    the_list.list_lines_count = params.fetch("query_list_lines_count")

    if the_list.valid?
      the_list.save
      redirect_to("/lists/#{the_list.id}", { :notice => "List updated successfully." } )
    else
      redirect_to("/lists/#{the_list.id}", { :alert => the_list.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_list = List.where({ :id => the_id }).at(0)

    the_list.destroy

    redirect_to("/lists", { :notice => "List deleted successfully." } )
  end
end
