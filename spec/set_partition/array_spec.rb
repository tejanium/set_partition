require 'set_partition'

describe SetPartition::Array do
  it "generate all possibility set forward" do
    set_partition = SetPartition::Array.new [:a, :b, :c, :d]

    set_partition.start.should eql [[:a,:b,:c,:d]]          # [0,0,0,0]
    set_partition.next.should eql  [[:a,:b,:c], [:d]]       # [0,0,0,1]
    set_partition.next.should eql  [[:a,:b,:d], [:c]]       # [0,0,1,0]
    set_partition.next.should eql  [[:a,:b], [:c,:d]]       # [0,0,1,1]
    set_partition.next.should eql  [[:a,:b], [:c], [:d]]    # [0,0,1,2]
    set_partition.next.should eql  [[:a,:c,:d], [:b]]       # [0,1,0,0]
    set_partition.next.should eql  [[:a,:c], [:b,:d]]       # [0,1,0,1]
    set_partition.next.should eql  [[:a,:c], [:b], [:d]]    # [0,1,0,2]
    set_partition.next.should eql  [[:a,:d], [:b, :c]]      # [0,1,1,0]
    set_partition.next.should eql  [[:a], [:b,:c,:d]]       # [0,1,1,1]
    set_partition.next.should eql  [[:a], [:b,:c], [:d]]    # [0,1,1,2]
    set_partition.next.should eql  [[:a,:d], [:b], [:c]]    # [0,1,2,0]
    set_partition.next.should eql  [[:a], [:b,:d], [:c]]    # [0,1,2,1]
    set_partition.next.should eql  [[:a], [:b], [:c,:d]]    # [0,1,2,2]
    set_partition.next.should eql  [[:a], [:b], [:c], [:d]] # [0,1,2,3]

    set_partition.next.should be_nil
  end

  it "generate all possibility set forward with partition size" do
    set_partition = SetPartition::Array.new [:a, :b, :c, :d], 2

    set_partition.start.should eql  [[:a,:b,:c], [:d]]       # [0,0,0,1]
    set_partition.next.should eql  [[:a,:b,:d], [:c]]       # [0,0,1,0]
    set_partition.next.should eql  [[:a,:b], [:c,:d]]       # [0,0,1,1]
    set_partition.next.should eql  [[:a,:c,:d], [:b]]       # [0,1,0,0]
    set_partition.next.should eql  [[:a,:c], [:b,:d]]       # [0,1,0,1]
    set_partition.next.should eql  [[:a,:d], [:b, :c]]      # [0,1,1,0]
    set_partition.next.should eql  [[:a], [:b,:c,:d]]       # [0,1,1,1]

    set_partition.next.should be_nil
  end

  it "#to_a" do
    set_partition = SetPartition::Array.new [:a, :b, :c, :d]

    set_partition.to_a.sort.should eql [
      [[:a,:b,:c,:d]],          # [0,0,0,0]
      [[:a,:b,:c], [:d]],       # [0,0,0,1]
      [[:a,:b,:d], [:c]],       # [0,0,1,0]
      [[:a,:b], [:c,:d]],       # [0,0,1,1]
      [[:a,:b], [:c], [:d]],    # [0,0,1,2]
      [[:a,:c,:d], [:b]],       # [0,1,0,0]
      [[:a,:c], [:b,:d]],       # [0,1,0,1]
      [[:a,:c], [:b], [:d]],    # [0,1,0,2]
      [[:a,:d], [:b, :c]],      # [0,1,1,0]
      [[:a], [:b,:c,:d]],       # [0,1,1,1]
      [[:a], [:b,:c], [:d]],    # [0,1,1,2]
      [[:a,:d], [:b], [:c]],    # [0,1,2,0]
      [[:a], [:b,:d], [:c]],    # [0,1,2,1]
      [[:a], [:b], [:c,:d]],    # [0,1,2,2]
      [[:a], [:b], [:c], [:d]]  # [0,1,2,3]
    ].sort
  end

  it "#to_a with partition size" do
    set_partition = SetPartition::Array.new [:a, :b, :c, :d], 2

    set_partition.to_a.sort.should eql [
      [[:a,:b,:c], [:d]],   # [0,0,0,1]
      [[:a,:b,:d], [:c]],   # [0,0,1,0]
      [[:a,:b], [:c,:d]],   # [0,0,1,1]
      [[:a,:c,:d], [:b]],   # [0,1,0,0]
      [[:a,:c], [:b,:d]],   # [0,1,0,1]
      [[:a,:d], [:b, :c]],  # [0,1,1,0]
      [[:a], [:b,:c,:d]]    # [0,1,1,1]
    ].sort
  end
end
