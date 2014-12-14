class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string("first_name")
      t.string("last_name")
      t.string("email", :limit => 50, :null => false)
      t.string("password", :null => false)
      t.boolean("status", :default => 0)
      t.timestamps
    end
  end

  def down
    drop_table("users")
  end
end
