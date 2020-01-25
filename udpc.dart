import 'dart:io';

void main(List<String> args) {
  RawDatagramSocket.bind(InternetAddress.ANY_IP_V4, 0)
      .then((RawDatagramSocket socket) {
    print('Sending from ${socket.address.address}:${socket.port}');
    int port = 2000;
    socket.send('Hello from UDP land!\n'.codeUnits,
        InternetAddress('192.168.43.40'), port);
  });
}
