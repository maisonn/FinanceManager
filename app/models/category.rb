class Category < ApplicationRecord
    def change
        create_table :categories do |t|
          t.string :name
          t.text :description
          t.timestamps
        end
    end
    def to_s
        name
    end
end
