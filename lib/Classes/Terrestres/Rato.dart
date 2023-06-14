import 'package:vaquinha/Classes/Abstratas/Terrestre.dart';
import 'package:vaquinha/Interfaces/IAnimaisQueArranham.dart';
import 'package:vaquinha/Interfaces/IAnimaisQueRoem.dart';

class Rato extends Terrestre implements IAnimaisQueArranham, IAnimaisQueRoem {
  Rato({
    required super.nome,
    required super.pontosDeVida,
    required super.cor,
  }) {
    super.quantidadeAtaques += 2;
  }
  
  @override
  double arranhar() {
    return 1;
  }
  
  @override
  double roer() {
    return 2;
  }

  @override
  void exibirAtaques() {
    super.exibirAtaquesBasicos();
    print("[ 3 ] - Arranhar");
    print("[ 4 ] - Roer");
  }
  
  @override
  double atacar(int codigoAtaqueASerRealizado) {
    if (codigoAtaqueASerRealizado == 1) {
      return super.comer();
    }

    if (codigoAtaqueASerRealizado == 2) {
      return super.beber();
    }

    if (codigoAtaqueASerRealizado == 3) {
      return arranhar();
    }

    if (codigoAtaqueASerRealizado == 4) {
      return roer();
    }

    return 0;
  }

}
