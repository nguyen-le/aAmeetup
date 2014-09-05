class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string  :title
      t.string  :location
      t.text  :description
      t.date    :date
      t.time  :time
      t.integer :user_id

      t.timestamps
    end
  end
end
