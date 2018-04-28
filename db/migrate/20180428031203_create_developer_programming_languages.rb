class CreateDeveloperProgrammingLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :developer_programming_languages do |t|
      t.references :developer, foreign_key: true
      t.references :programming_language, foreign_key: true, index: {name: "index_on_programming_language_id"}

      t.timestamps
    end
  end
end
