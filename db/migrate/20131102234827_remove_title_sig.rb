class RemoveTitleSig < ActiveRecord::Migration
  def change
    remove_column :babbles, :title
    remove_column :babbles, :signature
  end
end
