class CreateBuyers < ActiveRecord::Migration[5.2]
  def change
    create_table :buyers do |t|

    	t.string :title
        t.text :body
        t.string :image_id
        t.integer :genre_id
        t.string :email



      t.timestamps
    end
  end
end
