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

class MockDatabaseConnection
  def connect
    # do nothing
  end

  def add_message(m)
    # do nothing
  end
end

class MockMessage
    attr_accessor :text, :sent_message

    def initialize(text)
        @db = MockDatabaseConnection.new
        @text = text
        @sent_message = nil
    end

    def send()
        @sent_message = @text
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
    message = MessageSender.new(self, @db)
  end

end

class MessageSender 
    def initialize(message, db_connection)
        @message = message
        @db = db_connection
    end

    def send()
        @db.connect
        @db.add_message(@message.text)
        @sent_message = @message.text
    end
end

class TestMessage < Minitest::Test
  def test_message
    m = MockMessage.new("Hi there")
    m.send()
    assert_equal "Hi there", m.sent_message
  end
end
