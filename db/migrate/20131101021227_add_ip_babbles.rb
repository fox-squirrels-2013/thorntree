class AddIpBabbles < ActiveRecord::Migration
  def change
    add_column :babbles, :ip_address, :string
  end
end
