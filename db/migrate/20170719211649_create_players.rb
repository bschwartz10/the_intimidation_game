class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.integer :position
      t.string :nfl_team
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
