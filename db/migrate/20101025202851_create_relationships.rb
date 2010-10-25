class CreateRelationships < ActiveRecord::Migration
  def self.up
    create_table :relationships do |t|
      t.integer :follwer_id
      t.integer :followed_id

      t.timestamps
    end
	add_index :relationships, :follwer_id
	add_index :relationships, :followed_id
  end

  def self.down
    drop_table :relationships
  end
end
