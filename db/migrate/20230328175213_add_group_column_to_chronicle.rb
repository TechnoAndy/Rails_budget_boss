class AddGroupColumnToChronicle < ActiveRecord::Migration[7.0]
  def change
    add_column :chronicles, :group_id, :integer
  end
end
