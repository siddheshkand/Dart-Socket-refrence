import 'dart:io';
import 'dart:convert';

void main() {
  var data = "Hello, World";
  var codec = new Utf8Codec();
  List<int> dataToSend = codec.encode(data);
  var addressesIListenFrom = InternetAddress('192.168.0.5');
  int portIListenOn = 6789; //0 is random
  RawDatagramSocket.bind(addressesIListenFrom, portIListenOn)
      .then((RawDatagramSocket udpSocket) {
    udpSocket.listen((RawSocketEvent event) {
      if (event == RawSocketEvent.READ) {
        Datagram dg = udpSocket.receive();
        dg.data.forEach((x) => print(x));
        print(dg.toString());
      }
    });
    udpSocket.send(dataToSend, new InternetAddress('192.168.0.5'), 6);
    print('Did send data on the stream..');
  });
}
