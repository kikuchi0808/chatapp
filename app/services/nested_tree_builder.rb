# frozen_string_literal: true

class NestedTreeBuilder
  def self.from_ar(ar_relation)
    from_a ar_relation.to_a.map(&:serializable_hash)
  end

  def self.from_a(arr)
    nested_hash = Hash[arr.map { |e| [e['id'], e.merge('children' => [])] }]
    nested_hash.each do |_id, item|
      parent = nested_hash[item['parent_id']]
      parent['children'] << item if parent
    end
    nested_hash.select { |_id, item| item['parent_id'].nil? }.values
  end
end
