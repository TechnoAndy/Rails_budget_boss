# frozen_string_literal: true

class ChangeColumnTypeInChronicles < ActiveRecord::Migration[7.0]
  def change
    change_column :chronicles, :amount, :integer, using: 'amount::integer'
  end
end
