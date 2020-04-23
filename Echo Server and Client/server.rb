#!/usr/bin/env ruby
# ner0 https://www.github.com/real-ner0
# Echo Server Implementation in Ruby


require 'socket'


class Server


  def initialize(host, port)
    @inst_host = host
    @inst_port = port
    @server = TCPServer.open(host, port)
  end


  # Tells user that server is started on the given socket
  # Tells which key to use to kill the process
  
  def start_message
    puts "\nStarting Echo Server on #{@inst_host}:#{@inst_port}\n"
    puts "Hit CTRL + C to kill...\n"
  end


  def start_server
    start_message

    client = @server.accept

    while true
      line = client.gets
      client.puts line
      STDOUT.puts "Client sent: #{line}\n"
    end
  end

end


# Default Host and Port -> 127.0.0.1:9999
host = "127.0.0.1"
port = 9999


# Change host and port if user wants to
if not ARGV.length.between?(0,2)
  puts "Usage: server.rb <ip_address> <port>\n"
  Process.exit(1)
end

case ARGV.length
when 1
  host = ARGV[0]
when 2
  host = ARGV[0]
  port = ARGV[1]
end


# Create an instance and start the server
echo_ser = Server.new(host, port)
echo_ser.start_server

# End of Code
