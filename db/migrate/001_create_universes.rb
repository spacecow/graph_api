class CreateUniverses < ActiveRecord::Migration
  def change
    create_table :universes do |t|
      t.string :title
    end
  end
end
