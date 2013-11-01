class CreateBabbles < ActiveRecord::Migration
  def change
    create_table :babbles do |t|
      t.belongs_to :note
      t.string     :title
      t.string     :body
      t.string     :signature
      t.boolean    :original_note

      t.timestamps
    end
  end
end