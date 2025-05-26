class HomeController < ActionController::Base
  def index

    render({ :template => "home/index" })
  end

  def home
    render({ :template => "home/homepage" })
  end
  
end
