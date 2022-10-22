class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :email, null: false
      t.json :tokens, default: {}

      t.timestamps
    end
  end
end
