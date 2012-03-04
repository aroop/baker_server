class CreateBakerServerSubscriptions < ActiveRecord::Migration
  def change
    create_table :baker_server_subscriptions do |t|
      t.string :name
      t.text :description
      t.boolean :expiration_message

      t.timestamps
    end
  end
end
