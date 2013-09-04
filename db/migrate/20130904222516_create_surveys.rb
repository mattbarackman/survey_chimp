class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.references :author
      t.string :name
    end
  end
end
