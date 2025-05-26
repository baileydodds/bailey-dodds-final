Rails.application.routes.draw do
  # Routes for the User resource:

  # CREATE
  post("/insert_user", { :controller => "users", :action => "create" })
          
  # READ
  get("/users", { :controller => "users", :action => "index" })
  
  get("/users/:path_id", { :controller => "users", :action => "show" })
  
  # UPDATE
  
  post("/modify_user/:path_id", { :controller => "users", :action => "update" })
  
  # DELETE
  get("/delete_user/:path_id", { :controller => "users", :action => "destroy" })

  #------------------------------

  # devise_for :users
  
  # root to: "boards#index"
  root to: "home#index"
  # get("/", { :controller => "home", :action => "index" })
  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:
  get("/tracker", { :controller => "tracker", :action => "index" })
  # get "/your_first_screen" => "pages#first"
  
end
