class CreateInfomations < ActiveRecord::Migration[6.1]
  def change
    create_table :infomations do |t|
      t.string :name

      t.timestamps
    end
  end
end
