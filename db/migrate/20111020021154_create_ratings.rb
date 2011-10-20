class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :score
      t.belongs_to :mp3
      t.timestamps
    end
  end
end
