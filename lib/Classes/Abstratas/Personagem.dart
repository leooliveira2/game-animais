import 'package:vaquinha/Interfaces/IAtaque.dart';
import 'package:vaquinha/Interfaces/IExibicaoDeAtaques.dart';

abstract class Personagem implements IAtaque, IExibicaoDeAtaques {
  String nome;
  double pontosDeVida;
  String cor;
  int quantidadeAtaques = 0;

  Personagem({
    required this.nome,
    required this.pontosDeVida,
    required this.cor,
  });

  @override
  void exibirAtaques();
  
  @override
  double atacar(int codigoAtaqueASerRealizado);
}