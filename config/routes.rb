Rails.application.routes.draw do
  # Routes for the Recipe resource:

  # CREATE
  post("/insert_recipe", { :controller => "recipes", :action => "create" })

  # READ
  get("/recipes", { :controller => "recipes", :action => "index" })

  get("/recipes/:path_id", { :controller => "recipes", :action => "show" })

  # UPDATE

  post("/modify_recipe/:path_id", { :controller => "recipes", :action => "update" })

  # DELETE
  get("/delete_recipe/:path_id", { :controller => "recipes", :action => "destroy" })

  #------------------------------

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
