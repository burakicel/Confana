class InterfaceController < ApplicationController
  def index
  end

  def result
  	@input = params
  end
end
