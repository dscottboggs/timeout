struct Timeout(ResultType)
  @time : Time::Span
  @result = Channel(ResultType).new
  @timeout_indicator = Channel(Nil).new

  def try_for(&block : Proc(ResultType))
    spawn { @result.send block.call }
    spawn do
      sleep @time
      @timeout_indicator.send nil unless @timeout_indicator.closed?
    end
    select
    when res = @result.receive
      @timeout_indicator.close
      return res
    when @timeout_indicator.receive?
      raise Timeout::Reached.new @time
    end
  end

  def initialize(@time)
  end

  def self.try_for(time : Time::Span, &block : Proc(ResultType))
    new(time).try_for &block
  end
end

class Timeout::Reached < Exception
  def initialize(timeout : Time::Span)
    super "action timed out after #{timeout}"
  end
end
