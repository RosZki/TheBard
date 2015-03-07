class PlaylistsController < ApplicationController

  def index
	@playlists = User.find(session[:user_id]).playlists
  end

  def new
	@user = User.find(session[:user_id])
	@playlist = @user.playlists.build
  end
  
  def edit
	session[:playlist_id] = params[:id]
	redirect_to '/tracks'
  end
  
  def create
	@playlist = Playlist.new(playlist_params)
	@playlist.user_id = session[:user_id]
	if @playlist.save
		redirect_to '/playlists'
	else
		render "new"
	end
  end
	
	def player
		@playlists = User.find(session[:user_id]).playlists
		@playlist = Playlist.find(params[:id])
	end
	
	def destroy
		@playlist = Playlist.find(params[:id])
		id = @playlist.id
		tracks = @playlist.tracks
		if tracks
			tracks.destroy_all
		end
		@playlist.destroy
		redirect_to '/playlists'
	end
	
	private
	def playlist_params
		params.require(:playlist).permit(:name)
	end
	
end
