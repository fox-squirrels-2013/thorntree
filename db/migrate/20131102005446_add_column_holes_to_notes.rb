class AddColumnHolesToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :holes, :integer, default: 1
  end
end
