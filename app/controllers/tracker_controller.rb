class TrackerController < ActionController::Base
  def index
    render({ :template => "tracker/index" })
  end
end
