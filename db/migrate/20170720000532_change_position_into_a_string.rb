class ChangePositionIntoAString < ActiveRecord::Migration[5.1]
  def change
    change_column :players, :position, :string
  end
end
