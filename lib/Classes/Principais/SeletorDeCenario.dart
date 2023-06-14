import 'package:vaquinha/Enums/Cenarios.dart';

class SeletorDeCenario {

  Cenarios selecionarCenario() {
    List<Cenarios> cenariosASeremSorteados = []; 
    
    for (Cenarios cenario in Cenarios.values) {
      cenariosASeremSorteados.add(cenario);
    }

    cenariosASeremSorteados.shuffle();

    Cenarios cenarioEscolhido = cenariosASeremSorteados.first;

    return cenarioEscolhido;
  }

}