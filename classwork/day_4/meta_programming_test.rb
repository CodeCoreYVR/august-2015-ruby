class MetaProgrammingTest

  [:a, :b, :c, :d].each do |name|
    define_method(name) do
      puts "I'm the method #{name}"
    end
  end

  def method_missing(*args)
    puts "Method doesn't exist"
  end

end
