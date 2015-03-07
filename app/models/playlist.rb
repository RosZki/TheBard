class Playlist < ActiveRecord::Base
belongs_to :user
has_many :tracks, -> { order("position ASC") }
validates_uniqueness_of :name, :scope => [:user_id]

end
