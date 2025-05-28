class TrackerController < ActionController::Base
  def index
    render({ :template => "tracker/index" })
  end

  def show
    matching_performances = Performance.all

    @list_of_performances = matching_performances.order({ :created_at => :desc })

    render({ :template => "tracker/show" })
  end

end
