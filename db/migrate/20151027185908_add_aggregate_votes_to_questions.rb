class AddAggregateVotesToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :votes, :integer
  end
end
