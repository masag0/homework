class LRUCache
    def initialize(size)
      @array = Array.new(4)
    end

    def count
      # returns number of elements currently in cache
      @array.size
    end

    def add(el)
      # adds element to cache according to LRU principle
      if @array.include?(el)
        check_recent(el)
      else
        if count < 4
          @array.push(el)
        else
          @array.shift
          @array.push(el)
        end
      end
    end

    def show
      # shows the items in the cache, with the LRU item first
      p @array
    end

    private
    # helper methods go here!
    def check_recent(el)

        idx = @array.index(el)
        @array.delete_at(idx)
        @array.push(el)

    end
  end
