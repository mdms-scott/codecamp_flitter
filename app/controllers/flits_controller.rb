class FlitsController < ApplicationController

  before_filter :authenticate_user!

  def new
    @flit = Flit.new
  end

  def create
    @flit = Flit.create(params[:flit])
    if @flit.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @flit = Flit.find(params[:id])
    if @flit.destroy
      redirect_to root_path
    end
  end

end
