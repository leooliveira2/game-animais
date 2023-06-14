import 'package:vaquinha/Classes/Abstratas/Terrestre.dart';
import 'package:vaquinha/Interfaces/IAnimaisQueBicam.dart';

class Galinha extends Terrestre implements IAnimaisQueBicam {
  Galinha({
    required super.nome,
    required super.pontosDeVida,
    required super.cor,
  }) {
    super.quantidadeAtaques += 1;
  }
  
  @override
  double bicar() {
    return 2;    
  }

  @override
  void exibirAtaques() {
    super.exibirAtaquesBasicos();
    print("[ 3 ] - Bicar");
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
      return bicar();
    }

    return 0;
  }

}
