class CreateReeds < ActiveRecord::Migration
  def change
    create_table :reeds do |t|
      t.belongs_to :note
      t.string     :ip_address

      t.timestamps
    end
  end
end
