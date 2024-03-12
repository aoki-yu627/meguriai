class CreateSweets < ActiveRecord::Migration[6.1]
  def change
    create_table :sweets do |t|
      t.string :genre
      t.string :shashin
      t.string :name
      t.text :about
      t.string :url

      t.timestamps
    end
  end
end
