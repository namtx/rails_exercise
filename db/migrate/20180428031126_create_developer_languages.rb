class CreateDeveloperLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :developer_languages do |t|
      t.references :developer, foreign_key: true
      t.references :language, foreign_key: true

      t.timestamps
    end
  end
end
