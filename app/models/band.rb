class Band < ActiveRecord::Base
	attr_accessible :name
	validates :name, :presence => true, :uniqueness => :true

	has_many(:albums,
		:class_name => 'Album',
		:primary_key => 'id',
		:foreign_key => 'band_id')

	has_many(:tracks, :through => :albums, :source => :tracks)
end