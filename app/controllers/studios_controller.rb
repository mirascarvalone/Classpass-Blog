class StudiosController < ApplicationController
  def index
    @studios = Studio.all
  end

  def show
    @studio = Studio.find(params[:id])
    @posts = Post.where(studio: @studio)
    @post = Post.new
    @map_data = Gmaps4rails.build_markers(@studio) do |studio, marker|
     marker.lat studio.latitude
     marker.lng studio.longitude
     marker.infowindow studio.name
     marker.json({name: studio.name})
    end
  end

  def new
    @studio = Studio.new
  end

  def create
    @studio = Studio.new(studio_params)
    if @studio.save
      redirect_to @studio
    else
      @error = "Your studio couldn't save. Check that there is a studio name and address."
      render 'new'
    end
  end

  private
    def studio_params
      params.require(:studio).permit(:name, :address, :class_type)
    end

end