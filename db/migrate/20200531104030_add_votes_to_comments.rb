class AddVotesToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :up_votes, :integer, default: 0
    add_column :comments, :down_votes, :integer, default: 0
  end
end
