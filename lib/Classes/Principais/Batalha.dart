import 'package:vaquinha/Classes/Abstratas/Personagem.dart';
import 'package:vaquinha/Classes/Principais/CalculadoraDeDano.dart';
import 'package:vaquinha/Enums/Cenarios.dart';

class Batalha {
  Personagem jogador;
  Personagem oponente;
  Cenarios cenario;
  CalculadoraDeDano calculadoraDeDano;

  Batalha({
    required this.jogador,
    required this.oponente,
    required this.cenario,
    required this.calculadoraDeDano,
  });

  void rodada(
    double danoASerDado,
    Personagem personagemAReceberDano,
    bool personagemPossuiBonusDeCenario,
  ) {
    
    double danoASerAplicado = calculadoraDeDano.calcularDano(
      danoASerDado,
      personagemPossuiBonusDeCenario,
    );

    if (personagemAReceberDano == jogador) {
      jogador.pontosDeVida -= danoASerAplicado;
      return;
    }

    if (personagemAReceberDano == oponente) {
      oponente.pontosDeVida -= danoASerAplicado;
      return;
    }
  }
}
