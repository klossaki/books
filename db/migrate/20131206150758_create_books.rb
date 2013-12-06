class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.string :title
      t.integer :author_id
      t.integer :ISBN_10
      t.integer :ISBN_13

      t.timestamps
    end
    add_index :books, [:author_id]
  end

  def self.down
    remove_index :books, [:author_id]
    drop_table :books
  end

end
