class AddColumnIntegrity < ActiveRecord::Migration
  def change
    add_column :notes, :integrity, :integer, default: 1000
  end
end
