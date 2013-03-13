class CreateFlits < ActiveRecord::Migration
  def change
    create_table :flits do |t|
      t.text :message

      t.timestamps
    end
  end
end
