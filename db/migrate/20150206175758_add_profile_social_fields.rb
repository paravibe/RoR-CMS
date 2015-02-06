class AddProfileSocialFields < ActiveRecord::Migration
  def up
    add_column(:profiles, 'github', :string)
    add_column(:profiles, 'drupal', :string)
    add_column(:profiles, 'linkedin', :string)
  end

  def down
    remove_column(:profiles, 'github')
    remove_column(:profiles, 'drupal')
    remove_column(:profiles, 'linkedin')
  end
end
