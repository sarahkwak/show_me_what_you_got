class CreatPublicValues < ActiveRecord::Migration[5.2]
  def change
    create_table :public_values do |t|
      t.string :name, null: false
      t.string :app_keys, null: false
      t.string :app_id, null: false
      t.string :description
      t.string :extra_info
    end
  end
end
