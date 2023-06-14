import 'package:vaquinha/Classes/Abstratas/Terrestre.dart';
import 'package:vaquinha/Interfaces/IAnimaisQueRoem.dart';

class Castor extends Terrestre implements IAnimaisQueRoem {
  Castor({
    required super.nome,
    required super.pontosDeVida,
    required super.cor,
  }) {
    super.quantidadeAtaques += 1;
  }
  
  @override
  double roer() {
    return 3;
  }

  @override
  void exibirAtaques() {
    super.exibirAtaquesBasicos();
    print("[ 3 ] - Roer");
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
      return roer();
    }

    return 0;
  }
}
