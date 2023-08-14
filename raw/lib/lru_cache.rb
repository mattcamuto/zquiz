class LruCache
  def initialize(capacity: 10)
    @max_size = capacity
    @map_of_objects = {}
    @lru_tape = []
  end

  def size
    @map_of_objects.size
  end

  def remaining
    @max_size - size
  end

  def add_item(key, val)
    @map_of_objects[key] = val
    promote_just_used(key)
    val
  end

  def get_item(key)
    @map_of_objects[key].tap do |val|
      promote_just_used(key)
    end
  end

  def keys
    @map_of_objects.keys
  end

  protected

  def key_to_remove
    @lru_tape.shift if @lru_tape.size > @max_size
  end

  def promote_just_used(key)
    @lru_tape.delete(key)
    @lru_tape.append(key)
    key_to_evict = key_to_remove
    @map_of_objects.delete(key_to_evict) if key_to_evict
  end
end