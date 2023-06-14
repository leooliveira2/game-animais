import 'package:vaquinha/Classes/Abstratas/Terrestre.dart';

class Camelo extends Terrestre {
  Camelo({
    required super.nome,
    required super.pontosDeVida,
    required super.cor,
  }) {
    super.quantidadeAtaques += 1;
  }

  double corcovadaDupla() {
    return 4;
  }

  @override
  void exibirAtaques() {
    super.exibirAtaquesBasicos();
    print("[ 3 ] - Corcovada Dupla");
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
      return corcovadaDupla();
    }

    return 0;
  }
}
