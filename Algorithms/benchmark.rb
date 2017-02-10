require 'benchmark'
require_relative 'fibonacci_iterative'
require_relative 'fibonacci_recursive'
Benchmark.bmbm do |x|
   x.report("find fibonacci_iterative") do
     100.times do
       fib_i = Fib_Iterative.new
       fib_i.fib(20)
     end
   end

   x.report("find fibonacci_recursive") do
     100.times do
       fib_r = Fib_Recursive.new
       fib_r.fib(20)
     end
   end
end
