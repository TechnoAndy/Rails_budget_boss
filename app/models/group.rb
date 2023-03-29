# frozen_string_literal: true

class Group < ApplicationRecord
  # include ImageUploader::Attachment(:icon)

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :chronicles_groups, dependent: :destroy
  has_many :chronicles, through: :chronicles_groups, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3, too_short: 'Group name must be more than 3 characters long' }
end
