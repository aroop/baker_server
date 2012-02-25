class CreateBakerServerIssues < ActiveRecord::Migration
  def change
    create_table :baker_server_issues do |t|
      t.date :published_date
      t.date :end_date
      t.string :issue_id
      t.text :summary
      t.string :cover_art_uid
      t.timestamps
    end
  end
end
