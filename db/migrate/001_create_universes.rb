class CreateUniverses < ActiveRecord::Migration
  def up
    create_table :universes do |t|
      t.string :title, null:false
    end
    add_index :universes, :title, unique:true

  end

  def down
    drop_table :universes
  end
end
