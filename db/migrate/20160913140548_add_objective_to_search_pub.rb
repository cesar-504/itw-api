class AddObjectiveToSearchPub < ActiveRecord::Migration[5.0]
  def change
    add_reference :search_pubs, :objective, foreign_key: true
  end
end
