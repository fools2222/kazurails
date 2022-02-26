class Deletemethod < ActiveRecord::Migration[6.1]
  def change
    drop_table :homes
    drop_table :inquiries
  end
end
