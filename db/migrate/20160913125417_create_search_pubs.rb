class CreateSearchPubs < ActiveRecord::Migration[5.0]
  def change
    create_table :search_pubs do |t|
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
