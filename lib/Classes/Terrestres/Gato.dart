import 'package:vaquinha/Classes/Abstratas/Terrestre.dart';
import 'package:vaquinha/Interfaces/IAnimaisQueArranham.dart';

class Gato extends Terrestre implements IAnimaisQueArranham {
  Gato({
    required super.nome,
    required super.pontosDeVida,
    required super.cor,
  }) {
    super.quantidadeAtaques += 2;
  }
  
  @override
  double arranhar() {
    return 2;
  }

  double miar() {
    return 3;
  }

  @override
  void exibirAtaques() {
    super.exibirAtaquesBasicos();
    print("[ 3 ] - Arranhar");
    print("[ 4 ] - Miar");
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
      return miar();
    }

    return 0;
  }

  
}
