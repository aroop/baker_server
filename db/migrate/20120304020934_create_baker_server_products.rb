class CreateBakerServerProducts < ActiveRecord::Migration
  def change
    create_table :baker_server_products do |t|
      t.string :product_id
      t.string :content_uid
      t.string :name
      t.string :icon_uid
      t.string :preview_uid
      t.text :description
      t.boolean :paid

      t.timestamps
    end
  end
end
