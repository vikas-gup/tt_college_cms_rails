class CreateRequirement < ActiveRecord::Migration[5.0]
  def change
    create_table :requirements do |t|
      t.belongs_to :batch
      t.belongs_to :course
      t.integer :no_of_class
    end
  end
end
