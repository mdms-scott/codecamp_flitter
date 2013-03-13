class WelcomeController < ApplicationController
  
  def index
    @flits = Flit.all
  end
  
end
