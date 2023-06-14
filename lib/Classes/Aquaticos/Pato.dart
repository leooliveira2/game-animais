import 'package:vaquinha/Classes/Abstratas/Aquatico.dart';
import 'package:vaquinha/Interfaces/IAnimaisQueBicam.dart';
import 'package:vaquinha/Interfaces/IAnimaisQueVoam.dart';

class Pato extends Aquatico implements IAnimaisQueBicam, IAnimaisQueVoam {
  
  Pato({
    required super.nome,
    required super.pontosDeVida,
    required super.cor,
  }) {
    super.quantidadeAtaques += 3;
  }

  double quack() {
    return 4;
  }

  @override
  double bicar() {
    return 2;
  }

  @override
  double voar() {
    return 2;
  }

  @override
  void exibirAtaques() {
    super.exibirAtaquesBasicos();
    print("[ 3 ] - Quack");
    print("[ 4 ] - Bicar");
    print("[ 5 ] - Voar");
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
      return quack();
    }

    if (codigoAtaqueASerRealizado == 4) {
      return bicar();
    }

    if (codigoAtaqueASerRealizado == 5) {
      return voar();
    }

    return 0;
  }
}
