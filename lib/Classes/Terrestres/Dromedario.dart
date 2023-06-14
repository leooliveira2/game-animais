import 'package:vaquinha/Classes/Abstratas/Terrestre.dart';

class Dromedario extends Terrestre {
  Dromedario({
    required super.nome,
    required super.pontosDeVida,
    required super.cor,
  }) {
    super.quantidadeAtaques += 1;
  }
  

  double corcovada() {
    return 3;
  }

  @override
  void exibirAtaques() {
    super.exibirAtaquesBasicos();
    print("[ 3 ] - Corcovada");
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
      return corcovada();
    }

    return 0;
  }
}
