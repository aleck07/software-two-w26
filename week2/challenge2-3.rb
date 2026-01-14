class Email
  def initialize(headers, body)
    @headers = headers
    @body = body
    # @server = connect_to_mail_server()
    @logger = Logger.new()
  end

  def send(to)
    @logger.log(to, @headers)
    # construct_and_send_email(@server, to, @headers, @body)
  end
end

class Logger
  def log(to, headers)
    puts "To: #{to}, Subject: #{headers[:subject]}, From: #{headers[:from]}"
  end
end

m = Email.new(
  {:subject => "Hey!", :from => "beej@beej.us"},
  "How's it going? Have you heard the latest gossip?"
)

m.send("chris@example.com")
