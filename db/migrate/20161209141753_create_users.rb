class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :nickname
      t.integer :sex
      t.string :avatar

      t.timestamps
    end
  end
end
