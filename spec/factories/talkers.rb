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

FactoryGirl.define do
  factory :talker do
  end
end
