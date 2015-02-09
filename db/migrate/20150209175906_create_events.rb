class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :description
      t.date :date
      t.boolean :require_id
      t.belongs_to :location, index: true
    end
    add_foreign_key :events, :locations
  end
end
