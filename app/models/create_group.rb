# frozen_string_literal: true

class CreateGroup < ApplicationRecord
  belongs_to :group
  belongs_to :chronicle
end
