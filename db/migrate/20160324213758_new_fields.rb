class NewFields < ActiveRecord::Migration
  def change
    add_column :articles, :price, :text
  end
end
