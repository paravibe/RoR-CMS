class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string("first_name")
      t.string("last_name")
      t.string("email", :limit => 50, :null => false)
      t.string("password_digest", :null => false)
      t.boolean("status", :default => 0)
      t.timestamps
    end

    create_table :profiles do |t|
      t.belongs_to :user, index: true
      t.string("city")
      t.string("company")
    end
  end
end