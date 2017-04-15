# frozen_string_literal: true
require 'csv'

csv_text = File.read('db/fixtures/csvs/talker_rooms.csv')
CSV.parse(csv_text, headers: true)
   .map(&:to_hash)
   .each { |row| TalkerRoom.seed(:id, row) }
