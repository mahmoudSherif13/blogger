class AddAuthorToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :author_id, :integer
    add_index :comments, :author_id
    remove_column :comments, :author_name
  end
end
