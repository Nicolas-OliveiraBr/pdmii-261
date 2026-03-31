import 'dart:convert';

class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }

  Map<String, dynamic> toJson() => {"nome": _nome};
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }

  Map<String, dynamic> toJson() => {"nome": _nome, "dependentes": _dependentes};
}

class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeprojeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeprojeto;
    _funcionarios = funcionarios;
  }

  Map<String, dynamic> toJson() => {
    "nome": _nomeProjeto,
    "dependentes": _funcionarios,
  };
}

void main() {
  // Criando os objetos Dependentes de cada usuário
  // Craindo dependentes mães:
  var mae_um = new Dependente("Mãe do Zé");
  var mae_dois = new Dependente("Mãe do Rodrigo");
  var mae_tres = new Dependente("Mãe do Nicholas");
  var mae_quatro = new Dependente("Mãe do Giulia");

  // Criando dependentes pais:
  var pai_um = new Dependente("Pai do Zé");
  var pai_dois = new Dependente("Pai do Rodrigo");
  var pai_tres = new Dependente("Pai do Nicholas");
  var pai_quatro = new Dependente("Pai da Giulia");

  // Criando dependentes irmãos:
  var irmao_um = new Dependente("Irmã do Zé");
  var irmao_dois = new Dependente("Irmão do Rodrigo");
  var irmao_tres = new Dependente("Irmão do Nicholas");
  var irmao_quatro = new Dependente("Irmã da Giulia");

  // Criando listas com os dependentes de cada funcionário:
  var dependentesZe = [mae_um, pai_um, irmao_um];
  var dependentesRodrigo = [mae_dois, pai_dois, irmao_dois];
  var dependentesNicholas = [mae_tres, pai_tres, irmao_tres];
  var dependentesGiulia = [mae_quatro, pai_quatro, irmao_quatro];

  // Instanciando os objetos Funcionários:
  var func_um = new Funcionario("Zé", dependentesZe);
  var func_dois = new Funcionario("Rodrigo", dependentesRodrigo);
  var func_tres = new Funcionario("Nicholas", dependentesNicholas);
  var func_quatro = new Funcionario("Giulia", dependentesGiulia);

  // Criando uma lista de funcionário
  var funcionariosLista = [func_um, func_dois, func_tres, func_quatro];

  // Convertendo para JSON
  var equipe_um = new EquipeProjeto(
    "Projeto Social com a Família dos meus amigos",
    funcionariosLista,
  );

  String printMessage = jsonEncode(equipe_um);
  print(printMessage);

  // 1. Criar varios objetos Dependentes
  // 2. Criar varios objetos Funcionario
  // 3. Associar os Dependentes criados aos respectivos
  //    funcionarios
  // 4. Criar uma lista de Funcionarios
  // 5. Criar um objeto Equipe Projeto chamando o metodo
  //    contrutor que da nome ao projeto e insere uma
  //    coleção de funcionario
  // 6. Printar no formato JSON o objeto Equipe Projeto.
}
