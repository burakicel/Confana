class InterfaceController < ApplicationController
  def index
  end

  def result
  	@input = params[:search][:query]
  	@videos = Video.all
  end
end
