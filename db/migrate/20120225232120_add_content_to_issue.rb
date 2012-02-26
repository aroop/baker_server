class AddContentToIssue < ActiveRecord::Migration
  def change
    add_column :baker_server_issues, :paid, :boolean, :default => true
    add_column :baker_server_issues, :content_uid, :string
  end
end
