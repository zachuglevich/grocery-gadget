Rails.application.routes.draw do
  # Routes for the Ingredient resource:

  # CREATE
  post("/insert_ingredient", { :controller => "ingredients", :action => "create" })

  # READ
  get("/ingredients", { :controller => "ingredients", :action => "index" })

  get("/ingredients/:path_id", { :controller => "ingredients", :action => "show" })

  # UPDATE

  post("/modify_ingredient/:path_id", { :controller => "ingredients", :action => "update" })

  # DELETE
  get("/delete_ingredient/:path_id", { :controller => "ingredients", :action => "destroy" })

  #------------------------------

  devise_for :users
  
end
