# frozen_string_literal: true

class CreateChroniclesGroupsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :chronicles_groups, id: false do |t|
      t.references :chronicle, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
