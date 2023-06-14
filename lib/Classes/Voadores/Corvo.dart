import 'package:vaquinha/Classes/Abstratas/Voador.dart';
import 'package:vaquinha/Interfaces/IAnimaisQueBicam.dart';
import 'package:vaquinha/Interfaces/IAnimaisQueVoam.dart';

class Corvo extends Voador implements IAnimaisQueBicam, IAnimaisQueVoam {
  
  Corvo({
    required super.nome,
    required super.pontosDeVida,
    required super.cor,
  }) {
    super.quantidadeAtaques += 2;
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
    print("[ 3 ] - Bicar");
    print("[ 4 ] - Voar");
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

    if (codigoAtaqueASerRealizado == 4) {
      return voar();
    }

    return 0;
  }
}
