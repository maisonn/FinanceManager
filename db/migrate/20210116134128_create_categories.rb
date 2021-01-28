class CreateCategory < ActiveRecord::Migration[6.1]
  def change
    create_table :category do |t|
      t.string     :name
      t.string     :description
      # OR same result
      t.bigint     :category_id
    end
  end
end
