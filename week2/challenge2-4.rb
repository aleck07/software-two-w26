class Email
  attr_accessor :headers, :body

  def initialize(headers, body)
    @headers = headers
    @body = body
  end

  def send(to)
    # TODO: want to log here
    s = connect_to_mail_server()
    construct_and_send_email(s, to, @headers, @body)
    close_connection(s)
  end
end

class LoggingEmail < Email
  def send(to)
    log(to, @headers)
    super(to)
  end

  def log(to, headers)
    puts "To: #{to}, Subject: #{headers[:subject]}, From: #{headers[:from]}"
  end
end

# Don't change m1
m1 = Email.new(
  {:subject => "IBM meeting", :from => "gary@dri.com"},
  "I'm gonna miss that meeting, I'm going flying instead."
)

m1.send("chris@example.com")

# Don't change m2
m2 = Email.new(
  {:subject => "Hawaiian Shirt Friday", :from => "lumbergh@initech.com"},
  "Don't forget Friday is Hawaiian shirt Friday."
)

m2.send("pat@example.com")

# TODO: Only add logging for the `m3` instance, not the others
m3 = LoggingEmail.new(
  {:subject => "New game", :from => "kevin@flynnsarcade.com"},
  "Finished Space Paranoids! Come by and play it!"
)

m3.send("leslie@example.com")