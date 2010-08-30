class CreateEpithets < ActiveRecord::Migration
  def self.up
    create_table :epithets do |t|
      t.string :name
      t.boolean :valid

      t.timestamps
    end
  end

  def self.down
    drop_table :epithets
  end
end
