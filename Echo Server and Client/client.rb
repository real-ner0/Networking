#!/usr/bin/env ruby
# ner0 https://www.github.com/real-ner0


require 'socket'


class Client

  # Initialize the host and port using constructor
  def initialize(host, port)
    @inst_host = host
    @inst_port = port
  end
  

  # Open the socket
  def start_socket
    @s = TCPSocket.open(@inst_host, @inst_port)
  end

  # Send and recv from the server
  def request(message)
    @s.puts message
    response = @s.gets.chomp
    return response
  end

end


# Default host and port : 127.0.0.1:9999
host = "127.0.0.1"
port = 9999


# Change the host and port if user wants to

if not ARGV.length.between?(0,2)
  puts "Usage: client.rb <ip_addr> <port>\n"
  Process.exit(1)
end


case ARGV.length
when 1
  host = ARGV[0]
when 2
  host = ARGV[0]
  port = ARGV[1]
end


# Create instance and start connection

echo = Client.new(host, port)
echo.start_socket
puts "\nEnter /exit to close\n"

while true
  line = STDIN.gets.chomp

  if line == "/exit"
    break
  end

  response = echo.request(line)
  STDOUT.puts response
end

# End of Code
