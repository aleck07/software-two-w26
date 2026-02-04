require "minitest/autorun"

class DatabaseConnection
  # Pretend this is a real DB object
  def connect 
    sleep(10)
    raise "Database connection timed out"
  end

  def add_message(m)
    sleep(10)
    raise "Database insert timed out"
  end
end

class Message
  attr_accessor :text, :sent_message

  def initialize(text)
    @db = DatabaseConnection.new
    @text = text
    @sent_message = nil
  end

  def send()
    @db.connect
    @db.add_message(@text)
    @sent_message = @text
  end
end

class TestMessage < MiniTest::Test
  def test_message
    m = Message.new("Hi there")
    m.send()
    assert_equal "Hi there", m.sent_message
  end
end
