#!usr/bin/env ruby
# 【幽灵方法应用】

# class MyOpenStruct
#   def initialize
#     @attributes = {}
#   end
#   def method_missing(name,*args)
#      attributes = name.to_s
#      puts attributes.chop
#      if attributes =~ /=$/
#       @attributes[attributes.chop] = args[0]
#     else
#       @attributes[attributes]
#     end
#   end
# end
# icecream = MyOpenStruct.new
# icecream.flavor = "hello world"

# name  => flavor=
# args[0] => hello world
# attributes.chop  => 去除字符串最后一个任意字符
# =~ 正则匹配


# 【动态方法应用】

# class Computer
#   def initialize
#     puts "initialize..."
#   end
#   def self.define_computer(args)
#     define_method :abc do |args|
#       puts "this is #{args}"
#     end
#   end
#   define_computer :mouse
#   define_computer :keyboard
# end
# computer = Computer.new
# computer.abc(:mouse)
# computer.abc(:keyboard)


# 【使用基准程序对幽灵方法的性能评估,思路:如果类有该方法,则调用该方法,没有,就一直遍历祖先链直到找到该方法】
class String
  def method_missing(method , *args)
    method == :ghost_reverse ? reverse : super
  end
end

require 'benchmark'
Benchmark.bm do |b|
  b.report 'Normal method' do
    1000000.times do
      "abc".reverse
    end
  end

  b.report 'Ghost method' do
    1000000.times do
      "abc".ghost_reverse
    end
  end
end
