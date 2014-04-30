class AddNumVoteToComments < ActiveRecord::Migration
  def change
    add_column :comments, :numVote, :int, :null => false, :default => 0
  end
end
