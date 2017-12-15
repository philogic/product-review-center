class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :customer, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :rating
      t.text :comment

      t.timestamps
    end
  end
end
