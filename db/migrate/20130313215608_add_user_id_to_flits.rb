class AddUserIdToFlits < ActiveRecord::Migration
  def change
    add_column :flits, :user_id, :integer
  end
end
