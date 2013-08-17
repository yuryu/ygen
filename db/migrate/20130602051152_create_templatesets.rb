class CreateTemplatesets < ActiveRecord::Migration
  def change
    create_table :templatesets do |t|
      t.string :name
      t.references :user

      t.timestamps
    end
  end
end
