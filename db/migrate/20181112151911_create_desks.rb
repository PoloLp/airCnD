class CreateDesks < ActiveRecord::Migration[5.2]
  def change
    create_table :desks do |t|
      t.float :price
      t.string :title
      t.string :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
