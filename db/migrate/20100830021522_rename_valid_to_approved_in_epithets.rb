class RenameValidToApprovedInEpithets < ActiveRecord::Migration
  def self.up
    rename_column(:epithets, :valid, :approved)
  end

  def self.down
    rename_column(:epithets, :approved, :valid)
  end
end
