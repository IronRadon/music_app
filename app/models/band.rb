class Band < ActiveRecord::Base
	attr_accessible :name
	validates :name, :presence => true, :uniqueness => :true

	has_many(:albums,
		:class_name => 'Album',
		:primary_key => 'id',
		:foreign_key => 'band_id')

	has_many(:tracks, :through => :albums, :source => :tracks)

	def self.find_by_name(name)
		Band.where(:name => name).first
	end
end