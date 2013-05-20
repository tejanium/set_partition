require 'set_partition'

describe SetPartition::FixedGenerator do
  it "generate all possibility set forward" do
    set_partition = SetPartition::FixedGenerator.new 4, 2

    set_partition.start.should eql [0,0,0,1]
    set_partition.next.should eql [0,0,1,0]
    set_partition.next.should eql [0,0,1,1]
    set_partition.next.should eql [0,1,0,0]
    set_partition.next.should eql [0,1,0,1]
    set_partition.next.should eql [0,1,1,0]
    set_partition.next.should eql [0,1,1,1]

    set_partition.next.should be_nil
  end

  it "generate all possibility set backward" do
    set_partition = SetPartition::FixedGenerator.new 4, 2

    set_partition.end.should eql [0,1,1,1]
    set_partition.prev.should eql [0,1,1,0]
    set_partition.prev.should eql [0,1,0,1]
    set_partition.prev.should eql [0,1,0,0]
    set_partition.prev.should eql [0,0,1,1]
    set_partition.prev.should eql [0,0,1,0]
    set_partition.prev.should eql [0,0,0,1]

    set_partition.prev.should be_nil
  end
end
