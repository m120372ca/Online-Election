class CreateVoters < ActiveRecord::Migration
  def self.up
    create_table :voters do |t|
      t.string :name
      t.string :password
      t.string :constituency
      t.boolean :vote 

      t.timestamps
    end
  end

  def self.down
    drop_table :voters
  end
end
