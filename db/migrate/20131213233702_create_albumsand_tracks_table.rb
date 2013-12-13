class CreateAlbumsandTracksTable < ActiveRecord::Migration
  def change
  	create_table :albums do |t|
  		t.string :name, :null => false
  		t.integer :band_id, :null => false
  		t.string :recording_type, :null => false

  		t.timestamps
  	end
  	add_index :albums, :band_id
  	add_index :albums, [:name, :band_id], :unique => :true
  end

  def change
  	create_table :tracks do |t|
  		t.string :name
  		t.integer :album_id
  		t.integer :number
  		t.boolean :bonus

  		t.timestamps
  	end
  	add_index :tracks, :album_id
  end
end
