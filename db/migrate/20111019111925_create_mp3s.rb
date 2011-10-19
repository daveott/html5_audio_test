class CreateMp3s < ActiveRecord::Migration
  def change
    create_table :mp3s do |t|
      t.string :url
      t.string :title
      t.integer :length
      t.belongs_to :artist
      t.timestamps
    end
  end
end
