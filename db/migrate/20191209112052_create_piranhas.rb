class CreatePiranhas < ActiveRecord::Migration[5.2]
  def change
    create_table :piranhas do |t|

    	t.string :title
        t.text :body
        t.string :image_id
        t.integer :genre_id

      t.timestamps
    end
  end
end
