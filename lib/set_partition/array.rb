module SetPartition
  class Array
    def initialize array, partition_size=nil
      @array     = array
      @generator = if partition_size
                     FixedGenerator.new array.size, partition_size
                   else
                     Generator.new array.size
                   end
    end

    def start
      reify @generator.start
    end

    def end
      reify @generator.end
    end

    def next
      reify @generator.next
    end

    def prev
      reify @generator.prev
    end

    def partition_size
      @generator.size
    end

    def to_a
      [reify(@generator.start)].tap do |array|
        while @generator.next
          array.push reify @generator.current
        end
      end
    end

    def current
      reify @generator.current
    end

    private
      def reify partition
        return unless partition

        [].tap do |array|
          partition.each_with_index do |partition_index, i|
            array[partition_index] ||= []
            array[partition_index].push @array[i]
          end
        end
      end
  end
end
