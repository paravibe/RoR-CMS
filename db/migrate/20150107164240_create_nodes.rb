class CreateNodes < ActiveRecord::Migration
  def up
    create_table :nodes do |t|
      t.string("type")
      t.string("user_id")
      t.boolean("status", :default => 0)
      t.timestamps
    end
  end

  def down
    drop_table("nodes")
  end
end
