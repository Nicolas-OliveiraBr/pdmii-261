# Jogos de Linguagem (Ludwig Wittgenstein)

## 1. Conceitos

O conceito de **Jogos de Linguagem** (*Sprachspiele*) foi desenvolvido por Ludwig Wittgenstein em sua obra tardia, principalmente nas *Investigações Filosóficas* (1953), como uma ruptura com sua própria posição anterior no *Tractatus Logico-Philosophicus*, onde defendia que a linguagem funcionava como um espelho lógico da realidade (a chamada "teoria pictórica" do significado).

Na fase madura de seu pensamento, Wittgenstein passa a entender que **o significado de uma palavra não está numa correspondência fixa com um objeto do mundo, mas sim no seu uso dentro de uma prática compartilhada**. Ele compara a linguagem a um conjunto de jogos: assim como existem regras diferentes para o xadrez, o futebol ou o pôquer (e ninguém espera que as regras de um sirvam para o outro), existem também "jogos" distintos de linguagem, cada um com suas próprias regras, contextos e finalidades (dar ordens, fazer perguntas, contar piadas, rezar, descrever, xingar, cumprimentar etc.).

Abaixo, alguns pontos centrais do conceito:

- **Significado como uso**: "o significado de uma palavra é seu uso na linguagem" (§43 das *Investigações Filosóficas*).

- **Semelhanças de família (*family resemblances*)**: não existe uma essência comum a todos os jogos de linguagem, mas sim uma rede de semelhanças parciais, como entre membros de uma família.

- **Formas de vida (*Lebensformen*)**: os jogos de linguagem estão enraizados em práticas sociais e culturais concretas; entender uma linguagem é participar de uma forma de vida.

- **Regras seguidas em contexto**: as regras não são leis abstratas e universais, mas convenções que fazem sentido dentro da prática em que são aplicadas.

Esse deslocamento, do significado como representação para o significado como uso, tem implicações profundas para a filosofia da linguagem, a pedagogia e, como veremos, até para a lógica de construção de sistemas computacionais.

---

## 2. O Uso de Jogos de Linguagem no Ensino

A ideia de jogos de linguagem oferece uma base teórica valiosa para práticas pedagógicas, especialmente no ensino de línguas (materna ou estrangeira), mas também no ensino de qualquer disciplina que envolva vocabulário técnico e convenções próprias, como a própria programação.

Principais aplicações pedagógicas:

1. **Aprender uma língua é aprender a jogar**: em vez de ensinar palavras isoladas e suas "definições corretas", o professor cria situações de uso: diálogos, simulações, jogos de papéis (*role-play*), em que o aluno aprende o significado ao participar da prática comunicativa (pedir algo, negociar, argumentar, narrar).

2. **Contextualização em vez de memorização**: como o significado depende do contexto de uso, atividades descontextualizadas (nesse caso, como decorar listas de vocabulário) tendem a ser menos eficazes do que atividades que recriam um "jogo" real. Exemplos são uma entrevista de emprego simulada, um debate, uma compra em uma loja fictícia.

3. **Legitimação da diversidade de usos**: reconhecer que existem múltiplos jogos de linguagem (a linguagem científica, a linguagem cotidiana, a linguagem jurídica, a gíria de um grupo) ajuda o professor a validar diferentes registros linguísticos dos alunos, evitando hierarquizar uma única norma como "a linguagem correta". O contato com esses diversos registros linguísticos aprofunda o conhecimento dos alunos sobre a variação de sentido e a dinamização do uso desses termos na língua.

4. **Ensino de linguagens técnicas e formais**: em disciplinas como Matemática, Direito ou Programação, o aluno precisa aprender não apenas vocabulário, mas as *regras do jogo* daquela comunidade, o que pode e não pode ser dito, quais movimentos (operações, comandos, sentenças) são válidos. Ensinar "o jogo" (a prática, a lógica de uso) é mais eficaz do que ensinar apenas definições isoladas de termos.

5. **Avaliação formativa como parte do jogo**: erros deixam de ser vistos apenas como desvios de uma norma abstrata e passam a ser interpretados como tentativas de jogar o jogo — o professor pode então ajudar o aluno a compreender melhor as regras daquele jogo de linguagem específico.

Em suma, aplicar a noção de jogos de linguagem no ensino desloca o foco de "transmitir conteúdo" para "inserir o aluno em uma prática", em que o significado emerge do uso ativo e situado.

---

## 3. Jogos de Linguagem na Programação Orientada a Objetos (exemplo em Dart)

A Programação Orientada a Objetos (POO) é um terreno fértil para pensar com Wittgenstein, porque **cada classe define seu próprio "jogo de linguagem"**: um conjunto de métodos (movimentos permitidos), propriedades (peças do jogo) e convenções (regras) que só fazem sentido dentro daquele contexto — assim como uma jogada de xadrez não tem sentido nas regras do futebol.

Uma mesma palavra (um mesmo nome de método) pode significar coisas completamente diferentes dependendo da classe ("do jogo") em que é usada. Isso é justamente o fenômeno do **polimorfismo**, que é uma ilustração quase literal da tese de que "o significado é o uso no contexto".

### Exemplo em Dart

Considere o método `mover()`. Ele não tem um significado fixo e universal: seu significado depende inteiramente do "jogo de linguagem" (da classe) em que está inserido. Da mesma forma como a palavra "mover", dependendo do  contexto em que é utilizada, pode variar em sentido.

### *Obs.: O código abaixo também está presente no arquivo dart de exemplo (exemplo_jogos_linguagem.dart). Só é melhor explicado aqui.*

```dart
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

// --- Jogo de linguagem 3: Aplicativo de mapas ---
class Personagem implements Jogavel {
  final String nome;
  Personagem(this.nome);

  @override
  void mover() {
    print('$nome se desloca no cenário de um jogo digital, com física própria.');
  }
}

void main() {
  // A mesma "palavra" (mover) é usada em contextos (jogos) diferentes,
  // e seu significado só é compreendido dentro de cada jogo específico.
  List<Jogavel> participantes = [
    PecaXadrez('Bispo'),
    Jogador('Neymar'),
    Personagem('Mario'),
  ];

  for (var p in participantes) {
    p.mover(); // mesmo "vocábulo", significados distintos conforme o jogo/classe
  }
}
```

**Explicação do exemplo:**

- O método `mover()` funciona como uma palavra da linguagem natural: sintaticamente idêntica em todas as classes, mas **semanticamente definida apenas pelo contexto (a classe) em que é usada** — exatamente como Wittgenstein descreve o significado de uma palavra dentro de um jogo de linguagem.
- A interface `Jogavel` representa a ideia de **semelhança de família**: `PecaXadrez`, `Jogador` e `Personagem` compartilham a "forma" `mover()`, mas não uma essência comum de movimento — cada um tem sua própria "gramática" de regras.
- Isso pode ser relacionado a conceitos já vistos em aula, como o **polimorfismo**, além do estudo do próprio conceito filosófico, evidenciando que a Ciência da Computação também opera com jogos de linguagem: cada API, cada framework, cada linguagem de programação tem suas próprias regras de uso, e dominar a programação é, em certo sentido, aprender a "jogar" corretamente dentro dessas convenções.

---

## Evidências sugeridas para a atividade

1. **Texto explicativo** (evidência 1): este documento (`RESUMO.md`), contendo a explicação do conceito, sua aplicação pedagógica e o exemplo em POO.
2. **Documentação do uso de um Jogo de Linguagem** (evidência 2): o arquivo de código `exemplo_jogos_linguagem.dart`, comentado, mostrando o "jogo de linguagem" da POO em funcionamento.
3. **Publicação** (evidência 3):
   - Repositório do Github: <https://github.com/Nicolas-OliveiraBr/pdmii-261>;
   - Arquivos adicionados: (`RESUMO.md` e `exemplo_jogos_linguagem.dart`).
