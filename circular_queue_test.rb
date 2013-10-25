require 'test/unit'
require './circular_queue.rb'

class TestCircularQueue < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @test_data = %w(one two three four five six seven eight nine ten)
    @queue = CircularQueue.new(10, @test_data)
  end


  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  # Quick sanity check
  def test_object_creation
    assert_equal(CircularQueue, @queue.class, 'Object is not a CircularQueue as expected.')
  end

  def check_starting_data
    assert(@test_data - @queue == 0)
  end

  def test_data_length
    assert(@test_data.length == @queue.length)
  end

  def test_circularity
    @queue << "eleven"

    assert(@queue[0] == 'two')
    assert(@queue[9] == 'eleven')

  end

  def test_push_alias
    @queue.push "eleven"
    @queue.push "twelve"
    @queue.push "thirteen"

    assert_equal(@queue.length, 10)
    assert_equal(@queue[0], 'four')
    assert_equal(@queue[9], 'thirteen')
  end

  def test_maximum_size_alias
    assert_equal @test_data.length, @queue.max, 'Max sizes are unequal.'
  end

end