class CreateBatch < ActiveRecord::Migration[5.0]
  def change
    create_table :batches do |t|
      t.integer :code, presence: true, unique: true
      t.string :description
    end
  end
end
