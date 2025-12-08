Rails.application.routes.draw do

  get("/", { :controller => "home", :action => "home_display" })

  # Routes for the List line resource:
  # CREATE
  post("/insert_list_line", { :controller => "list_lines", :action => "create" })

  # READ
  get("/list_lines", { :controller => "list_lines", :action => "index" })

  get("/list_lines/:path_id", { :controller => "list_lines", :action => "show" })

  # UPDATE

  post("/modify_list_line/:path_id", { :controller => "list_lines", :action => "update" })

  # DELETE
  get("/delete_list_line/:path_id", { :controller => "list_lines", :action => "destroy" })

  #------------------------------

  # Routes for the Recipe line resource:
  # CREATE
  post("/insert_recipe_line", { :controller => "recipe_lines", :action => "create" })

  # READ
  get("/recipe_lines", { :controller => "recipe_lines", :action => "index" })

  get("/recipe_lines/:path_id", { :controller => "recipe_lines", :action => "show" })

  # UPDATE

  post("/modify_recipe_line/:path_id", { :controller => "recipe_lines", :action => "update" })

  # DELETE
  get("/delete_recipe_line/:path_id", { :controller => "recipe_lines", :action => "destroy" })

  #------------------------------

  # Routes for the List resource:
  # CREATE
  post("/insert_list", { :controller => "lists", :action => "create" })

  # READ
  get("/lists", { :controller => "lists", :action => "index" })

  get("/lists/:path_id", { :controller => "lists", :action => "show" })

  # UPDATE

  post("/modify_list/:path_id", { :controller => "lists", :action => "update" })

  # DELETE
  get("/delete_list/:path_id", { :controller => "lists", :action => "destroy" })

  #------------------------------

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
