# frozen_string_literal: true
# == Schema Information
#
# Table name: rooms
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# frozen_string_literal: true

class Room < ApplicationRecord
  validates :name, presence: true

  has_many :talker_rooms, dependent: :destroy
  has_many :talkers, through: :talker_rooms
  accepts_nested_attributes_for :talker_rooms,
                                reject_if: :reject_attributes,
                                allow_destroy: true

  def reject_attributes(attributes)
    exists = attributes[:id].present?
    empty = attributes[:talker_id].blank?
    attributes[:_destroy] = 1 if exists && empty
    !exists && empty
  end
end
