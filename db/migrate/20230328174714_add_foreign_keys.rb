# frozen_string_literal: true

class AddForeignKeys < ActiveRecord::Migration[7.0]
  def change
    add_reference :chronicles, :author, index: true, foreign_key: { to_table: :users }
  end
end
