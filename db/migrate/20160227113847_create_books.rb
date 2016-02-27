class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books, id: :uuid do |t|
      t.string  :title
      t.integer :number_of_pages

      t.timestamps null: false
    end
  end

end
