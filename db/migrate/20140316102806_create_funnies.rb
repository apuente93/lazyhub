class CreateFunnies < ActiveRecord::Migration
  def change
    create_table :funnies do |t|
      t.references :article, polymorphic: true, index: true

      t.timestamps
    end
  end
end
