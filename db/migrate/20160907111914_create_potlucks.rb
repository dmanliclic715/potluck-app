class CreatePotlucks < ActiveRecord::Migration
  def change
    create_table :potlucks do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.datetime :time, null: false
      t.integer :user_id, null: false

      t.timestamps(null: false)
    end
  end
end
