require "rest_client"
require "serialport"

port_str = "/dev/ttyACM0"
baud_rate = 9600
data_bits = 8
stop_bits = 1
parity = SerialPort::NONE
sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)

if sp
  loop do
    time = Time.now
    if time % 20
      temp = sp.gets
      RestClient.post "localhost:9393/", :temp => temp
    end
  end
else
  puts "No connection established"
end
