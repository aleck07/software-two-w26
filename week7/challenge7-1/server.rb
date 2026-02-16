require 'socket'
require 'uri'
require 'cgi'

server = TCPServer.new(8000)

loop do
  socket = server.accept
  request_line = socket.gets
  next unless request_line # Skip empty requests

  method, path, http_version = request_line.split
  uri = URI.parse(path) rescue nil
  query_params = CGI.parse(uri.query.to_s) if uri

  #puts "Request #{uri&.path}: #{query_params["word"][0]}"

  case uri&.path
  when '/upper/'
    response_body = query_params["word"][0].upcase
  when '/lower/'
    response_body = query_params["word"][0].downcase
  end

  socket.print "HTTP/1.1 200 OK\r\n" \
               "Content-Length: #{response_body.bytesize}\r\n" \
               "Content-Type: text/plain\r\n" \
               "Connection: close\r\n\r\n"
  socket.print response_body
  socket.close
end

