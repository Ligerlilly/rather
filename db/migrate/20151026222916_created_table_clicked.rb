class CreatedTableClicked < ActiveRecord::Migration
  def change
    create_table :clicks do |t|
      t.integer :question_id
      t.integer :user_id

      t.timestamps
    end
  end
end
