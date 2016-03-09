class StudiosController < ApplicationController
  def index
    @studios = Studio.all
  end

  def show
    @studio = Studio.find(params[:id])
    @posts = Post.where(studio: @studio)
    @map_data = Gmaps4rails.build_markers(@studio) do |studio, marker|
     marker.lat studio.latitude
     marker.lng studio.longitude
     marker.infowindow studio.name
     marker.json({name: studio.name})
    end
  end

end