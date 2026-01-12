class Email
  def initialize(headers, body)
    @headers = headers
    @body = body
  end

  def send(to)
    log_email(@headers[:from], to, @headers[:subject])
    s = connect_to_mail_server()
    construct_and_send_email(s, to, @headers, @body)
    close_connection(s)
  end

  # Log email details to the console
  def log_email(from, to, subject)
    puts "#{from},#{to},#{subject}"
  end
end

m = Email.new(
  {:subject => "Hey!", :from => "beej@beej.us"},
  "How's it going? Have you heard the latest gossip?"
)

# m.send("chris@example.com")
m.log_email("beej@beej.us", "chris@example.com", "Hey!")