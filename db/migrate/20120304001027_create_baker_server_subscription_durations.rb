class CreateBakerServerSubscriptionDurations < ActiveRecord::Migration
  def change
    create_table :baker_server_subscription_durations do |t|
      t.string :name
      t.timestamps
    end
    BakerServer::SubscriptionDuration.reset_column_information
    ["7 Days", "1 Month", "2 Months", "3 Months", "6 Months", "1 Year"].each do |name|
      BakerServer::SubscriptionDuration.create(name: name)
    end
  end
end
