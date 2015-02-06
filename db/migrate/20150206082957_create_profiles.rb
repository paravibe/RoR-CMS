class CreateProfiles < ActiveRecord::Migration
  def up
    create_table :profiles do |t|
      t.integer("user_id")
      t.string("city")
      t.string("company")
      t.text("social")
    end
  end

  def down
    drop_table("profiles")
  end
end
