require File.dirname(__FILE__) + '/test_helper.rb'

class TestMatcherBuilder < Matchy.test_case_class
  include Matchy::MatcherBuilder

  def setup
    @obj = Object.new
  end
  
  def test_matcher_responds_to_matches
    block = lambda {|given, matcher, args| true}
    build_matcher(:m, &block).should respond_to(:matches?)
  end
  
  def test_fail_positive
    block = lambda {|given, matcher, args| false}
    lambda {@obj.should build_matcher(:m, &block)}.should raise_error
  end
  
  def test_pass_positive
    block = lambda {|given, matcher, args| true}
    @obj.should build_matcher(:m, &block)
  end
  
  def test_fail_negative
    block = lambda {|given, matcher, args| true}
    lambda {@obj.should_not build_matcher(:m, &block)}.should raise_error
  end
  
  def test_pass_negative
    block = lambda {|given, matcher, args| false}
    @obj.should_not build_matcher(:m, &block)
  end
  
  def test_takes_arguments
    block = lambda {|given, matcher, args| $args = args; true}
    @obj.should build_matcher(:m,[1,2,3], &block)
    $args.should eql([1,2,3])
  end
  
  def test_received_method
    block = lambda {|given, matcher, args| $chained_messages = matcher.chained_messages; true}
    @obj.should build_matcher(:m, &block).method1
    $chained_messages[0].name.should eql(:method1)
  end
  
  def test_received_method_takes_args
    block = lambda {|given, matcher, args| $chained_messages = matcher.chained_messages; true}
    @obj.should build_matcher(:m, &block).method1(1,2,3)
    $chained_messages[0].args.should eql([1,2,3])
  end
  
  def test_received_method_takes_block
    block = lambda {|given, matcher, args| $chained_messages = matcher.chained_messages; true}
    @obj.should build_matcher(:m, &block).method1 { "Hello, World!"}
    $chained_messages[0].block.call.should eql("Hello, World!")
  end
  
  def test_received_method_chained
    block = lambda {|given, matcher, args| $chained_messages = matcher.chained_messages; true}
    @obj.should build_matcher(:m, &block).method1(1,2,3) { "Hello, World!"}.
      method2(4,5,6) { "Hello chained messages" }
      
    $chained_messages[0].name.should eql(:method1)
    $chained_messages[1].name.should eql(:method2)
    $chained_messages[0].args.should eql([1,2,3])
    $chained_messages[1].args.should eql([4,5,6])
    $chained_messages[0].block.call.should eql("Hello, World!")
    $chained_messages[1].block.call.should eql("Hello chained messages")
  end

end
