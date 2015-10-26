class RemoveContentFormQuestion < ActiveRecord::Migration
  def change
    remove_column :questions, :content
  end
end
