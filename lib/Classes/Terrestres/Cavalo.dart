import 'package:vaquinha/Classes/Abstratas/Terrestre.dart';
import 'package:vaquinha/Interfaces/IAnimaisQueDaoCoice.dart';

class Cavalo extends Terrestre implements IAnimaisQueDaoCoice {
  Cavalo({
    required super.nome,
    required super.pontosDeVida,
    required super.cor,
  }) {
    super.quantidadeAtaques += 1;
  }
  
  @override
  double coice() {
    return 4;
  }

  @override
  void exibirAtaques() {
    super.exibirAtaquesBasicos();
    print("[ 3 ] - Coice");
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
      return coice();
    }

    return 0;
  }
}
