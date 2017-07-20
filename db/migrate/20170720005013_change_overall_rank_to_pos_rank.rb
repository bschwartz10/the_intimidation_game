class ChangeOverallRankToPosRank < ActiveRecord::Migration[5.1]
  def change
    rename_column :stats, :overall_rank, :position_rank
  end
end
