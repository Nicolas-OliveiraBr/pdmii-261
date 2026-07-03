// "Jogo de linguagem" abstrato: define que todo Jogavel tem a
// regra/movimento chamado mover(), mas não diz o que ele significa.

abstract class Jogavel {
  void mover();
}

// --- Jogo de linguagem 1: Xadrez ---
class PecaXadrez implements Jogavel {
  final String nome;
  PecaXadrez(this.nome);

  @override
  void mover() {
    print('$nome se move seguindo as regras do xadrez.');
  }
}

// --- Jogo de linguagem 2: Futebol ---
class Jogador implements Jogavel {
  final String nome;
  Jogador(this.nome);

  @override
  void mover() {
    print('$nome corre pelo campo e pode chutar a bola.');
  }
}

// --- Jogo de linguagem 3: Aplicativo/jogo digital ---
class Personagem implements Jogavel {
  final String nome;
  Personagem(this.nome);

  @override
  void mover() {
    print('$nome se desloca no cenário de um jogo digital, com física própria.');
  }
}

void main() {
  // A mesma "palavra" (mover) é usada em jogos (classes) diferentes.
  // Seu significado só é compreendido dentro de cada jogo específico
  // — exatamente como Wittgenstein descreve o significado das palavras.
  List<Jogavel> participantes = [
    PecaXadrez('Bispo'),
    Jogador('Neymar'),
    Personagem('Mario'),
  ];

  for (var p in participantes) {
    p.mover(); // mesmo "vocábulo", significados distintos conforme o jogo/classe
  }
}
