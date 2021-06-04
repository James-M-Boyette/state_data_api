class CreateAbbreviations < ActiveRecord::Migration[6.1]
  def change
    create_table :abbreviations do |t|
      t.string :state
      t.string :abbrev
      t.string :code

      t.timestamps
    end
  end
end
