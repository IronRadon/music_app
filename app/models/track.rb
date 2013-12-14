class Track < ActiveRecord::Base
	attr_accessible :number, :album_id, :name, :bonus, :lyrics
	validates :number, :album_id, :name, :bonus, :presence => true

	belongs_to(:album,
		:class_name => 'Album',
		:primary_key => 'id',
		:foreign_key => 'album_id')

	has_one(:band, :through => :album, :source => :band)
end