class Email
  def initialize(headers, body)
    @headers = headers
    @body = body
  end

  def send(to)
    puts "#{@headers[:from]},#{to},#{@headers[:subject]}"
    do_send(to)
  end

  # Private method to handle the actual sending of the email
  private def do_send(to)
    s = connect_to_mail_server()
    construct_and_send_email(s, to, @headers, @body)
    close_connection(s)
  end
end

class TestEmail < Email
  def do_send(to)
  end
end

m = Email.new(
  {:subject => "Hey!", :from => "beej@beej.us"},
  "How's it going? Have you heard the latest gossip?"
)

e = TestEmail.new(
  {:subject => "Hello!", :from => "random@random.com"},
  "This is a test email."
)

# m.send("chris@example.com")
e.send("test@example.com")