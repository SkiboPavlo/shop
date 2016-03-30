class Fields < ActiveRecord::Migration
  def change
    change_column :articles, :status, :integer
    add_column :articles, :text, :text
    add_column :articles, :price, :text
  end
end
