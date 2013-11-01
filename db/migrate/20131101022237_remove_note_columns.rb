class RemoveNoteColumns < ActiveRecord::Migration
  def change
    remove_column :notes, :title
    remove_column :notes, :body
    remove_column :notes, :signature
  end
end