# frozen_string_literal: true

class CreateChronicles < ActiveRecord::Migration[7.0]
  def change
    create_table :chronicles do |t|
      t.string :name
      t.string :amount

      t.timestamps
    end
  end
end
