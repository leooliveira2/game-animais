import 'package:vaquinha/Classes/Abstratas/Aquatico.dart';
import 'package:vaquinha/Interfaces/IAnimaisQueMordem.dart';

class Jacare extends Aquatico implements IAnimaisQueMordem {
  Jacare({
    required super.nome,
    required super.pontosDeVida,
    required super.cor,
  }) {
    super.quantidadeAtaques += 1;
  }
  
  @override
  double morder() {
    return 4;
  }

  @override
  void exibirAtaques() {
    super.exibirAtaquesBasicos();
    print("[ 3 ] - Morder");
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
      return morder();
    }

    return 0;
  }
}
