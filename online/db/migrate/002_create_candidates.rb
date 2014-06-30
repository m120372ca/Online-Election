class CreateCandidates < ActiveRecord::Migration
  def self.up
    create_table :candidates do |t|
      t.string :name
      t.string :constituency
      t.integer :votes
      t.string :party

      t.timestamps
    end
  end

  def self.down
    drop_table :candidates
  end
end
