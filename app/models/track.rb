class Track < ActiveRecord::Base
belongs_to :playlist
mount_uploader :audio, AudioUploader
acts_as_list :scope => :playlist_id
serialize :metadata

def display_name
  @display_name ||= if metadata?
    artist, title = metadata.values_at('artist', 'title')
    title.present? ? [title, artist].compact.join(' - ').force_encoding('UTF-8') : File.basename(audio.path)
  else
    File.basename(audio.path)
  end
end

def extract_metadata
  open_opts = { :encoding => 'utf-8' }
  Mp3Info.open(audio.path, open_opts) do |mp3info|
    return mp3info.tag
  end
end

end
