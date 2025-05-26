Rails.application.routes.draw do
  # Routes for the Habit resource:

  # CREATE
  post("/insert_habit", { :controller => "habits", :action => "create" })
          
  # READ
  get("/habits", { :controller => "habits", :action => "index" })
  
  get("/habits/:path_id", { :controller => "habits", :action => "show" })
  
  # UPDATE
  
  post("/modify_habit/:path_id", { :controller => "habits", :action => "update" })
  
  # DELETE
  get("/delete_habit/:path_id", { :controller => "habits", :action => "destroy" })

  #------------------------------

  # Routes for the Performance resource:

  # CREATE
  post("/insert_performance", { :controller => "performances", :action => "create" })
          
  # READ
  get("/performances", { :controller => "performances", :action => "index" })
  
  get("/performances/:path_id", { :controller => "performances", :action => "show" })
  
  # UPDATE
  
  post("/modify_performance/:path_id", { :controller => "performances", :action => "update" })
  
  # DELETE
  get("/delete_performance/:path_id", { :controller => "performances", :action => "destroy" })

  #------------------------------

  devise_for :users
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
  get("/homepage", { :controller => "home", :action => "homepage" })
  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:
  get("/tracker", { :controller => "tracker", :action => "index" })
  # get "/your_first_screen" => "pages#first"
  get("/log_performance", { :controller => "performances", :action => "log" })  
end
