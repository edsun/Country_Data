class WorldController < ApplicationController
  def index
    @countries = Country.order("name DESC")
  end

  def by_population
    @countries = Country.order("population DESC")
  end

  def by_age
    @countries = Country.where("median_age > 30").order("median_age ASC")
  end

  def by_required_service
    @countries = Country.where(:mandatory_military_service => true).order('life_expectancy DESC')
  end
  
  # There is a associated view for this action
  def search
  end
 
  def search_results
    @keyword = params[:keyword]
    @filter = params[:my_option]
    
    if @filter == "1"
      @countries = Country.where("Name LIKE ?", "%#{@keyword}%")
    elsif @filter == "2"
      @countries = Country.where("Name LIKE ? AND mandatory_military_service == ?", "%#{@keyword}%", true)
    elsif @filter == "3"
      @countries = Country.where("Name LIKE ? AND mandatory_military_service == ?", "%#{@keyword}%", false)
    else
      @countries = ""
    end
    
    
    
    if @countries.empty?
      flash[:notice] = "No countries were found. with keyword #{@keyword}"
      session[:keyword] = @keyword
      redirect_to :action => 'index'
    end
    
  end
end
