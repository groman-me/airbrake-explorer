class Hash

  def symbolize_keys!
    keys.each do |key|
      self[(key.to_sym rescue key) || key] = delete(key)
    end
    self
  end

  def filter!(hash)
    filtered_keys = keys & hash.keys
    select!{ |k,_| filtered_keys.include? k }
    each_pair { |k, v| self[k] = v.filter! hash[k] if v.respond_to?(__method__) }
  end

  def keys_info
    reduce({}) do |memo, (k, v)|
      memo[k] = v.respond_to?(__method__) ? v.keys_info : v.class.name; memo
    end
  end

end
