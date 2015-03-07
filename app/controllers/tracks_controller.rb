class TracksController < ApplicationController
  def index
	@tracks = Playlist.find(session[:playlist_id]).tracks
  end

  def new
	@playlist = Playlist.find(session[:playlist_id])
	@track = @playlist.tracks.build
  end
  
  def create
	@track = Track.new(track_params)
	@track.playlist_id = session[:playlist_id]
	if @track.save
		@track.metadata = @track.extract_metadata
		@track.save
		redirect_to '/tracks'
	else
		render "new"
	end
  end

  def destroy
	@track = Track.find(params[:id])
	@track.destroy
	redirect_to '/tracks'
  end
  
  def move_up
	@track = Track.find(params[:id])
	if @track.first?
		@track.move_to_bottom
	else
		@track.move_higher
	end
	redirect_to '/tracks'
  end
  
  def move_down
	@track = Track.find(params[:id])
	if @track.last?
		@track.move_to_top
	else
		@track.move_lower
	end
	redirect_to '/tracks'
  end
  
  private
  def track_params
	params.require(:track).permit(:audio)
  end
end
