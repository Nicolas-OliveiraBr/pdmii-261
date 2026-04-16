import 'dart:io';
import 'dart:convert';

void main() async {
  final socketCreated = await Socket.connect('127.0.0.1', 3030);
  
  socketCreated.write('Client message: Hello!\n');
  
  socketCreated.listen(
    (data) => print('Server: ${utf8.decode(data)}'),
    onDone: () => socketCreated.destroy()
  );
}