class AddBodyToNodes < ActiveRecord::Migration
  def change
    add_column :nodes, :body, :text
  end
end
