class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :format
      t.references :templateset

      t.timestamps
    end
  end
end
