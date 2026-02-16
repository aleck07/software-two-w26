require 'minitest/autorun'
require_relative 'client'

class TestClient < Minitest::Test
  def test_client_upper
    tc = TextChanger.new("Hello!", client: FakeTextClient.new)
    assert tc.uppercase == "HELLO!"
    tc = TextChanger.new("hello", client: FakeTextClient.new)
    assert tc.uppercase == "HELLO"
    tc = TextChanger.new("HELLO", client: FakeTextClient.new)
    assert tc.uppercase == "HELLO"
    tc = TextChanger.new("AbCdEf", client: FakeTextClient.new)
    assert tc.uppercase == "ABCDEF"
  end

  def test_client_lower
    tc = TextChanger.new("Hello!", client: FakeTextClient.new)
    assert tc.lowercase == "hello!"
    tc = TextChanger.new("HELLO", client: FakeTextClient.new)
    assert tc.lowercase == "hello"
    tc = TextChanger.new("hello", client: FakeTextClient.new)
    assert tc.lowercase == "hello"
    tc = TextChanger.new("AbCdEf", client: FakeTextClient.new)
    assert tc.lowercase == "abcdef"
  end
end
