class CreateIssues < ActiveRecord::Migration[5.0]
  def change
    create_table :issues do |t|
      t.references :customer, foreign_key: true
      t.references :product, foreign_key: true
      t.string :severity
      t.string :status
      t.text :coment

      t.timestamps
    end
  end
end
