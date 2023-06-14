import 'package:vaquinha/Classes/Abstratas/Terrestre.dart';
import 'package:vaquinha/Interfaces/IAnimaisQueDaoCoice.dart';

class Vaca extends Terrestre implements IAnimaisQueDaoCoice {
  Vaca({
    required super.nome,
    required super.pontosDeVida,
    required super.cor,
  }) {
    super.quantidadeAtaques += 2;
  }
  
  @override
  double coice() {
    return 3;
  }

  double muuh() {
    return 3;
  }

  @override
  void exibirAtaques() {
    super.exibirAtaquesBasicos();
    print("[ 3 ] - Coice");
    print("[ 4 ] - Muuh");
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

    if (codigoAtaqueASerRealizado == 4) {
      return muuh();
    }

    return 0;
  }
}
