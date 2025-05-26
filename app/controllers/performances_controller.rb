class PerformancesController < ApplicationController
  def index
    matching_performances = Performance.all

    @list_of_performances = matching_performances.order({ :created_at => :desc })

    render({ :template => "performances/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_performances = Performance.where({ :id => the_id })

    @the_performance = matching_performances.at(0)

    render({ :template => "performances/show" })
  end

  def create
    the_performance = Performance.new
    # the_performance.created_at = params.fetch("query_created_at")
    # the_performance.updated_at = params.fetch("query_updated_at")
    the_performance.habit_id = params.fetch("query_habit_id")
    # the_performance.user_id = params.fetch("query_user_id")
    the_performance.performed_on = params.fetch("query_performed_on")

    if the_performance.valid?
      the_performance.save
      redirect_to("/performances", { :notice => "Performance created successfully." })
    else
      redirect_to("/performances", { :alert => the_performance.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_performance = Performance.where({ :id => the_id }).at(0)

    the_performance.created_at = params.fetch("query_created_at")
    the_performance.updated_at = params.fetch("query_updated_at")
    the_performance.habit_id = params.fetch("query_habit_id")
    the_performance.user_id = params.fetch("query_user_id")
    the_performance.performed_on = params.fetch("query_performed_on")

    if the_performance.valid?
      the_performance.save
      redirect_to("/performances/#{the_performance.id}", { :notice => "Performance updated successfully."} )
    else
      redirect_to("/performances/#{the_performance.id}", { :alert => the_performance.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_performance = Performance.where({ :id => the_id }).at(0)

    the_performance.destroy

    redirect_to("/performances", { :notice => "Performance deleted successfully."} )
  end

#----------------MY CUSTOM CODE-----------------------
  def log
    render({ :template => "performances/log_performance" })
  end
#----------------END OF MY CUSTOM CODE-----------------------
end
