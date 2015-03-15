class AddCommandsToUser < ActiveRecord::Migration
  def change
    add_column :users, :commands, :hstore, default: {}
  end
end
