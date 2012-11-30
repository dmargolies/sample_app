class TabsController < ApplicationController
  def new
    if params.has_key?("tab")
      @tab = params[:tab]
    else
      @tab=1
    end
  end
  

end
