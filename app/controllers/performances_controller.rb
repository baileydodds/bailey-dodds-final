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
    the_performance.created_at = Time.now
    the_performance.updated_at = Time.now
    the_performance.user_id = current_user.id
    the_performance.habit_id = params.fetch("query_habit_id")
    # the_performance.habit_name = params.fetch("query_habit_name")
    the_performance.performed_on = params.fetch("query_performed_on")

    if the_performance.valid?
      the_performance.save
      redirect_to("/performances", { :notice => "Workout logged. Great work, keep it up!" })
    else
      redirect_to("/performances", { :alert => the_performance.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_performance = Performance.where({ :id => the_id }).at(0)
    the_performance.created_at = Time.now
    the_performance.updated_at = Time.now
    the_performance.habit_id = params.fetch("query_habit_id")
    the_performance.user_id = current_user.id
    the_performance.performed_on = params.fetch("query_performed_on")

    if the_performance.valid?
      the_performance.save
      redirect_to("/performances", { :notice => "Performance updated successfully."} )
    else
      redirect_to("/performances", { :alert => the_performance.errors.full_messages.to_sentence })
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

  def new
    render({ :template => "performances/new" })
  end

  private

  def performance_params
    params.require(:performance).permit(:habit_name, :performed_on, :user_id)
  end
#----------------END OF MY CUSTOM CODE-----------------------
end
