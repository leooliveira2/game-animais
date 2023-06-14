import 'package:vaquinha/Classes/Abstratas/Personagem.dart';

abstract class Animal extends Personagem {
  
  Animal({
    required super.nome,
    required super.pontosDeVida,
    required super.cor,
  }) {
    super.quantidadeAtaques += 2;
  }

  double comer() {
    return 2;
  }

  double beber() {
    return 2;
  }

  void exibirAtaquesBasicos() {
    print("[ 1 ] - Comer");
    print("[ 2 ] - Beber");
  }
}