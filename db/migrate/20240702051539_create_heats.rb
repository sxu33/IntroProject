class CreateHeats < ActiveRecord::Migration[7.1]
  def change
    create_table :heats do |t|
      t.integer :value
      t.references :anime, null: false, foreign_key: true

      t.timestamps
    end
  end
end
