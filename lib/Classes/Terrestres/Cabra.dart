import 'package:vaquinha/Classes/Abstratas/Terrestre.dart';

class Cabra extends Terrestre {
  Cabra({
    required super.nome,
    required super.pontosDeVida,
    required super.cor,
  }) {
    super.quantidadeAtaques += 2;
  }

  double investida() {
    return 3;
  }

  double chifrada() {
    return 3;
  }

  @override
  void exibirAtaques() {
    super.exibirAtaquesBasicos();
    print("[ 3 ] - Investida");
    print("[ 4 ] - Chifrada");
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
      return investida();
    }

    if (codigoAtaqueASerRealizado == 4) {
      return chifrada();
    }

    return 0;
  }
}
