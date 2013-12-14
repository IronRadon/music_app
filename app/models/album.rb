class Album < ActiveRecord::Base
	attr_accessible :band_id, :name, :recording_type
	validates :band_id, :name, :recording_type, :presence => true

	belongs_to(:band,
						 :class_name => 'Band',
						 :primary_key => 'id',
						 :foreign_key => 'band_id')

end