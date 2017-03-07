class Computer
  def initialize(computer_id,data_source)
    @id = computer_id
    @data_source = data_source
  end
  def mouse
    info = @data_source.get_mouse_info(@id)
    price = @data_source.get_price_price(@id)
    result = "#{info}:#{price}"
    return "#{result}" if price >= 100
  end
  def cpu
    info = @data_source.get_cpu_info(@id)
    price = @data_source.get_cpu_price(@id)
    result = "#{info}:#{price}"
    return "#{result}" if price >= 100
  end
  def keyboard
    info = @data_source.get_keyboard_info(@id)
    price = @data_source.get_keyboard_price(@id)
    result = "#{info}:#{price}"
    return "#{result}" if price >= 100
  end
end

computer = Computer.new(ztid,abc)
computer.mouse
computer.cpu
computer.keyboard

# 【动态方法进行重构】
class Computer
  def initialize(computer_id,data_source)
    @id = computer_id
    @data_source = data_source
    data_source.methods.grep(/^get_(.*)_info$/){ # 匹配括号中正则表达式会存放在全局变量 $1 中
      Computer.define_component($1)
    }
  end
  def self.define_component(name)
    define_method(name) do
      info = @data_source.send("get_(#{name}_info)",@id)
      price = @data_source.send("get_(#{name}_price)",@id)
      result = "#{info}:#{price}"
      return result if price >= 100
    end
  end
end

# 【幽灵方法进行重构】
class Computer
  def initialize(computer_id,data_source)
    @id = computer_id
    @data_source = data_source
  end
  def method_missing(name)
    super unless @data_source.respond_to?("get_#{name}_info)") do
      info = @data_source.send("get_#{name}_info",@id)
      price = @data_source.send("get_#{name}price",@id)
      result = "#{info}:#{price}"
      return result if price >= 100
    end
  end
  def respond_to_missing?(method,include_private = false)
    @data_source.respond_to?(method) || super
  end
end

# 【覆写 method_missing 的时候应该覆写 respond_to_missing？方法】
