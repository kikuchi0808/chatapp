# frozen_string_literal: true
require 'csv'

csv_text = File.read('db/fixtures/csvs/talker.csv')
CSV.parse(csv_text, headers: true)
   .map(&:to_hash)
   .each { |row| Talker.seed(:id, row) }
