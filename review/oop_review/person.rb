class Person
  def initialize(name, email_address)
    @name, email_address = name, email_address
    puts "Hello. My name is #{name} and my email address is #{email_address}."
  end

  def name
    puts @name
  end

  def name=(new_name)
    @name = new_name
  end

  def name
    "hahahaha you will never know!!!"
  end
end
