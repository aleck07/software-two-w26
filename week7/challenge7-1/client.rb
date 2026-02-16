require 'socket'
require 'uri'

class TextClient
  def initialize(host: 'localhost', port: 8000)
    @host = host
    @port = port
  end

  def get(path, query_params = {})
    query_string = URI.encode_www_form(query_params)
    socket = TCPSocket.open(@host, @port)
    socket.print "GET #{path}?#{query_string} HTTP/1.1\r\n" \
                 "Host: #{@host}:#{@port}\r\n" \
                 "Connection: close\r\n\r\n"
    response = socket.read
    socket.close

    response.split("\r\n\r\n", 2)[1]
  end
end

class FakeTextClient
  def get(path, query_params = {})
    case path
    when '/upper/'
      query_params[:word].upcase
    when '/lower/'
      query_params[:word].downcase
    end
  end
end

class TextChanger
  def initialize(word, client: TextClient.new)
    @word = word
    @client = client
  end

  def uppercase
    @client.get('/upper/', { word: @word })
  end

  def lowercase
    @client.get('/lower/', { word: @word })
  end
end

if __FILE__ == $0
  tc1 = TextChanger.new("Hello!")
  pp tc1.uppercase   # "HELLO!"
  pp tc1.lowercase   # "hello!"
end
