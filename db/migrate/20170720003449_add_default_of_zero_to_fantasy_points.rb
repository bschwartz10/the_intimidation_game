class AddDefaultOfZeroToFantasyPoints < ActiveRecord::Migration[5.1]
  def change
    change_column_default :stats, :fantasy_points, 0
  end
end
