class CreateStats < ActiveRecord::Migration[5.1]
  def change
    create_table :stats do |t|
      t.integer :pass_yards, default: 0
      t.integer :pass_tds, default: 0
      t.integer :interceptions, default: 0
      t.integer :rush_yards, default: 0
      t.integer :rush_tds, default: 0
      t.integer :rec_yards, default: 0
      t.integer :rec_tds, default: 0
      t.integer :receptions, default: 0
      t.integer :overall_rank
      t.integer :fantasy_points
      t.references :player, foreign_key: true
      t.timestamps
    end
  end
end
