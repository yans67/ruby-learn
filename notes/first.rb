# 【自省】
# class Greeting
#   def initialize(text)
#     @text = text
#   end
#
#   def welcome
#     @text
#   end
# end
# my_object = Greeting.new("Hello World!")

# puts my_object.class  # 询问该类
# puts my_object.class.instance_methods(false) # 询问实例方法
# puts my_object.instance_variables # 询问实例变量

# 运行代码的时候，我们可以看到相应的输出，由此可见，ruby 具有自省功能，根据此功能，我们就可以动态的添加方法、变量等操作。

# 【打开类】
# def to_alphanumeric(s)
#   s.gsub(/[^\w\s]/,'') # 截取单词和字符
# end
# puts to_alphanumeric('#3, the *Ma gin d ,number') # => '3 the Ma gin d number'

# 【对象、类的本质】
# puts Greeting.superclass,Object.superclass,BasicObject.superclass
# puts Greeting.class,Class.class,Class.superclass,Module.superclass

# module M
#   class Mclass
#   end
#   def Mdef
#     MMMMM
#   end
# end
# class MM
# end

# puts Module.constants.grep(/^[M]/)
# puts M.constants(false)

#【细化（打开类的改善方案）】
module StringExtensions
  refine String do
    def to_alphanumeric
      puts gsub(/[^\w\s]/,'')
    end
  end
end
using StringExtensions
"abc sadf ,  dasf".to_alphanumeric