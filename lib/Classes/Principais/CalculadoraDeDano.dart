import 'dart:math';

class CalculadoraDeDano {
  
  double calcularDano(double danoASerCalculado, bool personagemPossuiBonusDeCenario) {
    int chanceDoDanoSerAplicado = Random().nextInt(2);
    
    if (chanceDoDanoSerAplicado == 0) {
      return 0;
    }

    int chanceDoDanoAplicadoSerCritico = Random().nextInt(5) + 1;

    if (chanceDoDanoAplicadoSerCritico == 1) {
      if (personagemPossuiBonusDeCenario) {
        return (danoASerCalculado * 2) * 0.10;
      }

      return danoASerCalculado * 2;
    }
    
    if (personagemPossuiBonusDeCenario) {
      return danoASerCalculado * 0.10;
    }

    return danoASerCalculado;
  }
}
