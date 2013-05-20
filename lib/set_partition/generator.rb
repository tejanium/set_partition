module SetPartition
  class Generator
    attr_reader :current

    def initialize length
      @length = length
      initialize_first
      initialize_last
      start
    end

    def start
      @current = @first.dup
      @maximum = @first.dup
    end
    alias :rewind :start

    def end
      @current = @last.dup
      @maximum = @last.dup
    end

    def next
      return if @current == @last
      next_partition
      @current
    end

    def prev
      return if @current == @first
      previous_partition
      @current
    end
    alias :previous :prev

    def length
      partition_length
    end

    private
      def initialize_first
        @first = [0] * @length
      end

      def initialize_last
        @last = 0.upto(@length - 1).to_a
      end

      def next_partition
        (@length - 1).downto(1) do |i|
          if @current[i] <= @maximum[i - 1]
            @current[i] = @current[i] + 1
            @maximum[i] = [@maximum[i], @current[i]].max

            (i + 1).upto(@length - 1) do |j|
              @current[j] = @current[0]
              @maximum[j] = @maximum[i]
            end
            return
          end
        end
      end

      def previous_partition
        (@length - 1).downto(1) do |i|
          if @current[i] > @current[0]
            @current[i] = @current[i] - 1
            @maximum[i] = @maximum[i] - 1

            (i + 1).upto(@length - 1) do |j|
              @current[j] = @maximum[j] = @maximum[i] + j - i
            end
            return
          end
        end
      end

      def partition_length
        @maximum[@length - 1] - @maximum[0] + 1
      end
  end
end
