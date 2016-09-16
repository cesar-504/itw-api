class FixNameType < ActiveRecord::Migration[5.0]
  def change
    remove_column :objectives, :type
  end
end
