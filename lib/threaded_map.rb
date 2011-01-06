module Enumerable
  def threaded_map
    results = map{nil}
    ts = []
    each_with_index do |obj,i|
      ts << Thread::new{results[i] = yield obj}
    end
    ts.each &:join
    results
  end
end
