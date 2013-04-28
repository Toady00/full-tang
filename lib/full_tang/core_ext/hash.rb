class Hash

  # Return an identical hash, but any values that are a Proc are called
  # and the value is replaced with the return value of the Proc.
  #
  # @example Hash with a Proc for Time
  #
  #   hash_with_proc = { time: Time.now.to_s }
  #   hash = hash_with_proc.call_procs
  #   # => { time: "2013-04-28 12:49:57 -0400" }
  #
  # @return [Hash]
  def call_procs
    Hash[
      self.map do |key, value|
        value.is_a?(Proc) ? [key, value.call] : [key, value]
      end
    ]
  end

  def call_procs!
    self.each do |key, value|
      self[key] = value.is_a?(Proc) ? value.call : value
    end
  end

  def symbolize_keys!
    keys.each do |key|
      self[(key.to_sym rescue key) || key] = delete(key)
    end
    self
  end unless defined? symbolize_keys
end
