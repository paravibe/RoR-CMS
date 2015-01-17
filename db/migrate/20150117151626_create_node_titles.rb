class CreateNodeTitles < ActiveRecord::Migration
  def up
    create_table :node_titles, :id => false do |t|
      t.integer("node_id")
      t.string("title")
    end
  end

  def down
    drop_table("node_titles")
  end
end
