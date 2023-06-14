import 'package:vaquinha/Classes/Abstratas/Aquatico.dart';

class Hipopotamo extends Aquatico {
  
  Hipopotamo({
    required super.nome,
    required super.pontosDeVida,
    required super.cor,
  }) {
    super.quantidadeAtaques += 1;
  }

  double barrigada() {
    return 3;
  }

  @override
  void exibirAtaques() {
    super.exibirAtaquesBasicos();
    print("[ 3 ] - Barrigada");
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
      return barrigada();
    }

    return 0;
  }
}
