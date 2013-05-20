# SetPartition

Ruby implementation of [Partition of a Set](http://en.wikipedia.org/wiki/Partition_of_a_set) based on paper *Efficient Generation of Set Partitions* by [Michael Orlov](mailto:orlovm@cs.bgu.ac.il)

## Installation

Add this line to your application's Gemfile:

    gem 'set_partition'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install set_partition

## Usage

    set_partition = SetPartition::Generator.new 4
    set_partition.start #=> [0,0,0,0]
    set_partition.next  #=> [0,0,0,1]
    set_partition.next  #=> [0,0,1,0]

    set_partition = SetPartition::FixedGenerator.new 4, 2
    set_partition.start #=> [0,0,0,1]
    set_partition.next  #=> [0,0,1,0]
    set_partition.next  #=> [0,0,1,1]

    set_partition = SetPartition::Array.new [:a, :b, :c, :d]
    set_partition.start  #=> [[:a,:b,:c,:d]]          # [0,0,0,0]
    set_partition.next   #=> [[:a,:b,:c], [:d]]       # [0,0,0,1]
    set_partition.next   #=> [[:a,:b,:d], [:c]]       # [0,0,1,0]

    set_partition = SetPartition::Array.new [:a, :b, :c, :d], 2
    set_partition.start #=> [[:a,:b,:c], [:d]]       # [0,0,0,1]
    set_partition.next  #=> [[:a,:b,:d], [:c]]       # [0,0,1,0]
    set_partition.next  #=> [[:a,:b], [:c,:d]]       # [0,0,1,1]

    set_partition = SetPartition::Array.new [:a, :b, :c, :d], 2
    set_partition.to_a
    #=>[
    #   [[:a,:b,:c], [:d]],
    #   [[:a,:b,:d], [:c]],
    #   [[:a,:b], [:c,:d]],
    #   [[:a,:c,:d], [:b]],
    #   [[:a,:c], [:b,:d]],
    #   [[:a,:d], [:b, :c]],
    #   [[:a], [:b,:c,:d]]
    # ]

## TODO
- The Ruby Way

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
