class CreateMaraudes < ActiveRecord::Migration
  def change
    create_table :maraudes do |t|
      t.date :date
      t.text :rencontres

      t.timestamps null: false
    end
  end
end
