class AddImageToPlayers < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :img_src, :string
  end
end
