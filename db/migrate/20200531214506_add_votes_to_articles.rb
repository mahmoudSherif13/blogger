class AddVotesToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :up_votes, :integer, default: 0
    add_column :articles, :down_votes, :integer, default: 0
  end
end
