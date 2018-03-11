class CreateProfessor < ActiveRecord::Migration[5.0]
  def change
    create_table :professors do |t|
      t.string :name, presence: true
    end
  end
end
