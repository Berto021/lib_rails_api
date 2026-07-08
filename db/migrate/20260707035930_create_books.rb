class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :publication_year
      t.integer :status, default:0, null: false
      t.integer :rating

      t.timestamps
    end
  end
end
