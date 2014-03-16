class CreateFunnies < ActiveRecord::Migration
  def change
    create_table :funnies do |t|
      t.string :content
      t.belongs_to :article, index: true

      t.timestamps
    end
  end
end
