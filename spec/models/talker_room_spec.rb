# frozen_string_literal: true
# == Schema Information
#
# Table name: talker_rooms
#
#  id         :integer          not null, primary key
#  talker_id  :integer          not null
#  room_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TalkerRoom, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
