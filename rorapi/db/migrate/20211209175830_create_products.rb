class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.numeric :value
      t.text :tags

      t.timestamps
    end
  end
end
