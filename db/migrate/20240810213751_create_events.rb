class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :location
      t.datetime :date
      t.references :organizer, null: false, foreign_key: { to_table: :users}

      t.timestamps
    end
  end
end
