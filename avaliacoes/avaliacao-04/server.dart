import 'dart:math'; // improtando a biblioteca math que possui a classe Random
import 'dart:io'; // importando a biblioteca io que fornece as classes utilizadas para as conexões e interações com o sistema operacional (IO) [Socket é um exemplo]
import 'dart:async'; // Importando a biblioteca async que fornece as principais classes de manutencão da assincronicidade (Future<T> e Timer são exemplos)

// Criando a função que retorna as temperaturas como valores double de duas casas decimais, que podem variar de -10°C a 35°C

double temperatureGen() {

  var random = Random();
  double randomTemperature = -10 + (random.nextDouble() * 45);
  randomTemperature = (randomTemperature * 10).round() / 10;
  print('- Temperature: $randomTemperature°C');

  return randomTemperature;
}

// Criando a função principal responsável por receber os dados da função acima e enviá-los para os clientes

Future<void> periodicBroadcast({
  required Duration intervalo, // A função exige um intervalo (definido para 10 segundos posteriormente)
  required String Function() gerarDados, // A função exige o retorno de uma função (os valores em double)
  required Set<Socket> clients, // A função exige os clientes que receberão as temperaturas
  }) async { // Função assíncrona que executa o envio das temperaturas aos clientes periodicamente
  Timer.periodic(intervalo, (timer) {
    final dados = gerarDados();
    if (clients.length == 0) {
      print('No one is connected and receiving this data. Looking for clients...');
    } else {
      print('Sending $dados to ${clients.length} clients.');
    };
    
    // Imprime as informações diretamente no terminal dos clientes que se conectaram com sucesso
    for (final client in clients) { 
      try {
        client.write(dados);
      } catch (e) {
        clients.remove(client);
        print('Error! The error was identified and registered as "$e.". Client connection has been deactivated.');
      }
    }
  });
}

void main() async {
  // Iniciando o servidor e definindo o socket para o(s) cliente(s)
  final serverCreated = await ServerSocket.bind(InternetAddress.anyIPv4, 3030);
  final clients = <Socket>{};

  // Verificando quando o usuário clica Ctrl + C no terminal do servidor e fecha-o
  ProcessSignal.sigint.watch().listen((_) async {
    await serverCreated.close();
    exit(0);
  });

  // Imprime mensagens sobre a conexão do servidor e uma instrução que informa o usuário a apertar Ctrl + C para finalizar o envio de dados pelo servidor
  print('Server adress: ${serverCreated.address.address}, PORT: ${serverCreated.port}');
  print('The server is running. If you wish to stop, press Ctrl+C.');
  print('\n');

  // Envia as informções para a classe 'Future<void> periodicBroadcast'
  periodicBroadcast(
    intervalo: Duration(seconds: 10),
    gerarDados: () => temperatureGen().toString(), // Convertendo o valor para String
    clients: clients
  );

  // Função que identifica a conexão realizada pelo(s) cliente(s)
  await for (final client in serverCreated) {
    clients.add(client);
    print('New client connected: ${client.remoteAddress.address}.'); // Mostra o endereço IP do cliente que recebe as temperaturas

    // Recebe uma pequena mensagem de teste do cliente para confirmar a conexão com o servidor
    client.listen(
      (data) {
        print('Client message: ${String.fromCharCodes(data).trim()}');
      },

      // Identifica quando é acionado o comando Ctrl + C no terminal do cliente e o remove
      onDone: () {
        print('Client has been disconected.');
        clients.remove(client);
        client.close();
      },

      // Identifica algum erro durante a ligação com o cliente e fecha o cliente
      onError: (_) {
        clients.remove(client);
        client.close();
      }
    );
  }
}