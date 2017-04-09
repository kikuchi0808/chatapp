# frozen_string_literal: true
# == Schema Information
#
# Table name: talkers
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# frozen_string_literal: true

class Talker < ApplicationRecord
  has_many :messages
  has_many :talker_rooms, dependent: :destroy
  has_many :rooms, through: :talker_rooms
end
