import 'package:vaquinha/Classes/Abstratas/Terrestre.dart';

class Elefante extends Terrestre {
  Elefante({
    required super.nome,
    required super.pontosDeVida,
    required super.cor,
  }) {
    super.quantidadeAtaques += 1;
  }

  double trombadaSuprema() {
    return 4;
  }

  @override
  void exibirAtaques() {
    super.exibirAtaquesBasicos();
    print("[ 3 ] - Trombada Suprema");
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
      return trombadaSuprema();
    }

    return 0;
  }
}
