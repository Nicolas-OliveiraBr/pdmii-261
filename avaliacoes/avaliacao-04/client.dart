import 'dart:io'; // importando a biblioteca io que fornece as classes utilizadas para as conexões e interações com o sistema operacional (IO) [Socket é um exemplo]
import 'dart:convert'; // importando a biblioteca convert para a conversão de dados codificados em UTF8, nesse código, para um String

void main() async {
  // Criando o socket que se conecta com o servidor a partir da porta
  final socketCreated = await Socket.connect('127.0.0.1', 3030);
  
  // Escreve uma mensagem no terminal do servidor, mostrando que o cliente realizou a conexão
  socketCreated.write('Client message: Hello!\n');
  
  // Ouve o que é enviado ao cliente, decodifica os dados enviados pelo servidor, imprime no terminal e fecha quando não houve mais dados no socket
  socketCreated.listen(
    (data) => print('Server: ${utf8.decode(data)}'),
    onDone: () => socketCreated.destroy()
  );
}