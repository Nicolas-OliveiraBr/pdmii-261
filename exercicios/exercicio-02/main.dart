void main() {

  // Criando uma pilha principal que servirá para adicionar todos os livros lidos

  var pilhaLIvros = ["It: A Coisa", "Meu Pé de Laranja Lima", "Alíce no País das Maravilhas"];

  // Criando algumas pilhas com livros já lidos
  var pilhaPercyJackson = ["Percy Jackson e o Ladrão de Raios", "Percy Jackson e o Mar de Monstros"];
  var pilhaHarryPotter = ["Harry Potter e a Pedra Filosofal"];
  var pilhaOutrosLivros = ["A Culpa é das Estrelas",  "Coraline", "Whatever"];

  // Criando algumas variáveis que serão usadas para definir o título dos livros quando forem adicionados
  var livro1 = "";
  var livro2 = "";
  var livro3 = "";

  // Criando uma função que exibe o conteúdo das pilhas já pré-definidas no código
  void mostrar_pilhas() {
    print('- Pilha de livros da Coleção "Percy Jackson": $pilhaPercyJackson');
    print('- Pilha de livros da Coleção "Harry Potter": $pilhaHarryPotter');
    print('- Pilha com outros livros: $pilhaOutrosLivros');
    print('Pilha de "Livros Lidos": $pilhaLIvros\n');
  }

  // Criando uma função que adiciona novos livros ao fim das pilhas correspondentes e que, por fim, adiciona à pilha de "Livros Lidos"
  void adicionar_livros() {
    livro1 = "Percy Jackson e a Maldição do Titã"; // Adicionando um novo livro para a pilha de "Percy Jackson"
    pilhaPercyJackson.add(livro1);
    print('- Pilha com o novo livro: + $pilhaPercyJackson');
  
    livro2 = "Harry Potter e a Câmara Secreta"; // Adicionando um novo livro para a pilha de "Harry Potter"
    pilhaHarryPotter.add(livro2);
    print('- Pilha com o novo livro: + $pilhaHarryPotter');

    livro3 = "O Irmão Alemão"; // Adicionando um novo livro para a pilha de "Outros Livros"
    pilhaOutrosLivros.add(livro3);
    print('- Pilha com o novo livro: + $pilhaOutrosLivros');
  
    // Adicionando tudo à pilha de "Livros Lidos"
    pilhaLIvros.addAll(pilhaPercyJackson);
    pilhaLIvros.addAll(pilhaHarryPotter);
    pilhaLIvros.addAll(pilhaOutrosLivros);
    print('Pilha de "Livros Lidos": $pilhaLIvros\n');
  }

  // Criando uma função para mostrar os últimos livros lidos
  void mostrar_ultimos_lidos() {
    var ultiumoPercyJackson = pilhaPercyJackson.last;
    var ultimoHarryPotter = pilhaHarryPotter.last;
    var ultimoOutrosLIvros = pilhaOutrosLivros.last;
    var ultimoLivroLIdo = pilhaLIvros.last;

    print('''Os Últimos Livros Lidos:
          - Coleção Percy Jackson: $ultiumoPercyJackson
          - Coleção Harry Potter: $ultimoHarryPotter
          - Lista de "Livros LIdos": $ultimoOutrosLIvros
          - Último livro lido: $ultimoLivroLIdo\n''');
  }

  // Criand uma função que remove o último livro de cada pilha
  void remover_livros() {
    pilhaPercyJackson.removeLast();
    pilhaOutrosLivros.removeLast();
    pilhaOutrosLivros.removeLast();
    pilhaLIvros.removeLast();

    mostrar_pilhas(); // Rodando a mesma função de mostrar as pilhas de livros para a atualização das pilhas
  }

  mostrar_ultimos_lidos(); // Mostrando os livros que foram lidos por último em cada pilha
  adicionar_livros(); // Empilhando os livros
  remover_livros(); // Desempilhando os livros
  mostrar_pilhas(); // Mostrando o que há nas pilhas
}