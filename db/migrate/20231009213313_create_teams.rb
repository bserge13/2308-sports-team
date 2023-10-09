class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :team_name
      t.string :city
      t.boolean :expansion_team
      t.integer :number_of_titles

      t.timestamps
    end
  end
end
