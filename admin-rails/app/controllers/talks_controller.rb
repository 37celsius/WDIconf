class TalksController < ApplicationController
  
  def index
    @talks = Talk.all
  end

  def create
    @talk = Talk.new(get_talk_params)
    if @talk.save
      redirect_to "/talks/#{@talk.id}"
    else
      render :new
    end
  end

  def new
    @talk = Talk.new
  end

  def show
    @talk = Talk.find(params[:id])
  end

  def edit
    @talk = Talk.find(params[:id])
  end

  def update
    @talk = Talk.find(params[:id])
    if @talk.update(get_talk_params)
      redirect_to talk_path
    else
      render :edit
    end
  end

  def destroy
    @talk = Talk.find(params[:id])
    @talk.destroy
    redirect_to '/talks'
  end

  def get_talk_params
    binding.pry
    params.require(:talk).permit(:title, :blurb, :description, :speaker_id, :date, :duration, :limit)
  end

end
