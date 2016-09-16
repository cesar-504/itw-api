class CreateObjectives < ActiveRecord::Migration[5.0]
  def change
    create_table :objectives do |t|
      t.string :first_name
      t.string :last_name
      t.string :description
      t.string :type

      t.timestamps
    end
  end
end
