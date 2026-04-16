import 'dart:math';
import 'dart:io';
import 'dart:async';

double temperatureGen() {

  var random = Random();
  double randomTemperature = -10 + (random.nextDouble() * 45);
  randomTemperature = (randomTemperature * 10).round() / 10;
  print('- Temperatura: $randomTemperature');

  return randomTemperature;
}

Future<void> periodicBroadcast({
  required Duration intervalo,
  required String Function() gerarDados,
  required Set<Socket> clients,
  }) async {
  await for (final _ in Stream.periodic(intervalo)) {
    final dados = await gerarDados();
    
    clients.removeWhere((c) => c.done == true);
    
    for (final client in clients) {
      client.write(dados);
    }
  }
}

void main() async {
  final serverCreated = await ServerSocket.bind(InternetAddress.anyIPv4, 3030);
  final clients = <Socket>{};

  ProcessSignal.sigint.watch().listen((_) async {
    await serverCreated.close();
    exit(0);
  });

  print('Server adress: ${serverCreated.address.address}, PORT: ${serverCreated.port}');
  print('The server is running. If you wish to stop, press Ctrl+C.');
  print('\n');

  await for (final client in serverCreated) {
    print('Server started!');
    clients.add(client);
    client.listen((_) { print('Client active');},

      onDone: () {
        print('Client leaving...');
        clients.remove(client);
        client.close();
      },
      onError: (_) {
        clients.remove(client);
        client.close();
      }
    );
  }

  await periodicBroadcast(
    intervalo: Duration(seconds: 10),
    gerarDados: () => temperatureGen().toStringAsFixed(2),
    clients: clients
  );
}