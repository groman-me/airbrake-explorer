class FilterCollection
  def initialize(collection)
    @collection = collection
  end

  def filter(pattern = {})
    return @collection if pattern.blank?
    @collection.map { |n| n.filter! pattern }
  end
end
