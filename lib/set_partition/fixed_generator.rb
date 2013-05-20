module SetPartition
  class FixedGenerator < Generator
    def initialize length, partition
      @partition = partition
      super length
    end

    private
      def initialize_first
        @first = [0] * (@length - @partition)

        (@length - @partition).upto(@length - 1) do |i|
          @first[i] = i - (@length - @partition)
        end
      end

      def initialize_last
        @last = 0.upto(@partition - 1).to_a

        @partition.upto(@length - 1) do |i|
          @last[i] = @partition - 1
        end
      end

      def next_partition
        p = partition_length

        (@length - 1).downto(1) do |i|
          if (@current[i] < p - 1) && @current[i] <= @maximum[i - 1]
            @current[i] = @current[i] + 1
            @maximum[i] = [@maximum[i], @current[i]].max

            (i + 1).upto(@length - (p - @maximum[i])) do |j|
              @current[j] = 0
              @maximum[j] = @maximum[i]
            end

            (@length - (p - @maximum[i]) + 1).upto(@length - 1) do |j|
              @current[j] = @maximum[j] = p - (@length - j)
            end
            return
          end
        end
      end

      def previous_partition
        p = partition_length

        (@length - 1).downto(1) do |i|
          if @current[i] > 0 && (p - @maximum[i - 1] <= @length - i )
            @current[i] = @current[i] - 1
            @maximum[i] = @maximum[i - 1]

            (i + 1).upto(i + (p - @maximum[i]) - 1) do |j|
              @current[j] = @maximum[j] = @maximum[i] + j - i
            end

            (i + (p - @maximum[i])).upto(@length - 1) do |j|
              @current[j] = @maximum[j] = p -1
            end
            return
          end
        end
      end
  end
end
