import 'dart:io';
import 'dart:math';

import 'package:vaquinha/Classes/Abstratas/Personagem.dart';
import 'package:vaquinha/Classes/Aquaticos/Hipopotamo.dart';
import 'package:vaquinha/Classes/Aquaticos/Jacare.dart';
import 'package:vaquinha/Classes/Aquaticos/Pato.dart';
import 'package:vaquinha/Classes/Aquaticos/PeixeBoi.dart';
import 'package:vaquinha/Classes/Aquaticos/Sapo.dart';
import 'package:vaquinha/Classes/Principais/Batalha.dart';
import 'package:vaquinha/Classes/Principais/CalculadoraDeDano.dart';
import 'package:vaquinha/Classes/Principais/SeletorDeCenario.dart';
import 'package:vaquinha/Classes/Terrestres/Cabra.dart';
import 'package:vaquinha/Classes/Terrestres/Camelo.dart';
import 'package:vaquinha/Classes/Terrestres/Castor.dart';
import 'package:vaquinha/Classes/Terrestres/Cavalo.dart';
import 'package:vaquinha/Classes/Terrestres/Dromedario.dart';
import 'package:vaquinha/Classes/Terrestres/Elefante.dart';
import 'package:vaquinha/Classes/Terrestres/Galinha.dart';
import 'package:vaquinha/Classes/Terrestres/Gato.dart';
import 'package:vaquinha/Classes/Terrestres/Leao.dart';
import 'package:vaquinha/Classes/Terrestres/Rato.dart';
import 'package:vaquinha/Classes/Terrestres/Vaca.dart';
import 'package:vaquinha/Classes/Voadores/Aguia.dart';
import 'package:vaquinha/Classes/Voadores/Corvo.dart';
import 'package:vaquinha/Classes/Voadores/Falcao.dart';
import 'package:vaquinha/Classes/Voadores/Papagaio.dart';
import 'package:vaquinha/Enums/Cenarios.dart';

void main(List<String> args) {
  int totalDePersonagens = 20;

  exibePersonagensJogaveis();

  int idPersonagemSelecionado = selecionarPersonagem(totalDePersonagens);

  String nomePersonagem;
  String corPersonagem;

  while (true) {
    print("-" * 30);

    print("Informe o nome do seu personagem:");
    String? nomePersonagemInput = stdin.readLineSync();

    print("-" * 30);

    print("Informe a cor do seu personagem!");
    String? corPersonagemInput = stdin.readLineSync();

    print("-" * 30);

    if (nomePersonagemInput != null && corPersonagemInput != null) {
      nomePersonagem = nomePersonagemInput;
      corPersonagem = corPersonagemInput;
      break;
    }

    print("Informe valores nos campos nome e cor!");
  }

  double pontosDeVida = 30;

  Personagem? instanciaPersonagemDoJogador = instanciarPersonagem(
    idPersonagem: idPersonagemSelecionado,
    nomePersonagem: nomePersonagem,
    pontosDeVida: pontosDeVida,
    corPersonagem: corPersonagem,
  );

  int idOponente = Random().nextInt(totalDePersonagens) + 1;
  Personagem? instanciaPersonagemOponente = instanciarPersonagem(
    idPersonagem: idOponente,
    pontosDeVida: pontosDeVida,
  );

  if (instanciaPersonagemDoJogador != null && instanciaPersonagemOponente != null) {
    SeletorDeCenario seletorDeCenario = SeletorDeCenario();
    Cenarios cenarioSorteado = seletorDeCenario.selecionarCenario();
    CalculadoraDeDano calculadoraDeDano = CalculadoraDeDano();

    Batalha batalha = Batalha(
      jogador: instanciaPersonagemDoJogador,
      oponente: instanciaPersonagemOponente,
      cenario: cenarioSorteado,
      calculadoraDeDano: calculadoraDeDano,
    );

    while (true) {
      print("-" * 30);

      print("Ataques dísponiveis");
      instanciaPersonagemDoJogador.exibirAtaques();
      print("-" * 30);

      double danoASerDado;

      while (true) {
        print("-" * 30);
        
        print("Informe o código do ataque que deseja utilizar:");

        String? codAtaqueInput = stdin.readLineSync();

        if (codAtaqueInput != null) {
          if (int.tryParse(codAtaqueInput) != null) {
            int codigoAtaque = int.parse(codAtaqueInput);

            if (codigoAtaque > 0 && codigoAtaque <= instanciaPersonagemDoJogador.quantidadeAtaques) {
              danoASerDado = instanciaPersonagemDoJogador.atacar(codigoAtaque);
              break;
            }
          }
        }

        print("Por favor, escolha um ataque válido!");

        print("-" * 30);
      }

      print("-" * 30);
      batalha.rodada(danoASerDado, instanciaPersonagemOponente, false,);
      print("${instanciaPersonagemDoJogador.nome} atacou!");
      print("-" * 30);

      int quantidadeAtaquesOponente = instanciaPersonagemOponente.quantidadeAtaques;
      int codigoAtaqueOponente = Random().nextInt(quantidadeAtaquesOponente) + 1;

      double danoASerDadoPeloOponente = instanciaPersonagemOponente.atacar(codigoAtaqueOponente);

      batalha.rodada(danoASerDadoPeloOponente, instanciaPersonagemDoJogador, false);
      print("${instanciaPersonagemOponente.nome} atacou!");
      print("-" * 30);

      print("Situação da Batalha: ");
      print("Pontos de vida do jogador: ${instanciaPersonagemDoJogador.pontosDeVida}");
      print("Pontos de vida do oponente: ${instanciaPersonagemOponente.pontosDeVida}");
      print("-" * 30);

      if (instanciaPersonagemDoJogador.pontosDeVida <= 0) {
        print("Fim da batalha! Oponente te venceu!");
        break;
      }

      if (instanciaPersonagemOponente.pontosDeVida <= 0) {
        print("Fim da batalha! Você venceu!");
        break;
      }
    }
  }
}

// Funcoes usadas na main

void exibePersonagensJogaveis() {
  print("Qual personagem deseja selecionar?");

  print("-" * 30);

  print("[ 1 ] Águia\n"
      "[ 2 ] Cabra\n"
      "[ 3 ] Camelo\n"
      "[ 4 ] Castor\n"
      "[ 5 ] Cavalo\n"
      "[ 6 ] Corvo\n"
      "[ 7 ] Dromedário\n"
      "[ 8 ] Elefante\n"
      "[ 9 ] Falcão\n"
      "[ 10 ] Galinha\n"
      "[ 11 ] Gato\n"
      "[ 12 ] Hipopótamo\n"
      "[ 13 ] Jacaré\n"
      "[ 14 ] Leão\n"
      "[ 15 ] Papagaio\n"
      "[ 16 ] Pato\n"
      "[ 17 ] Peixe-Boi\n"
      "[ 18 ] Rato\n"
      "[ 19 ] Sapo\n"
      "[ 20 ] Vaca");

  print("-" * 30);
}

int selecionarPersonagem(int totalDePersonagens) {
  int idPersonagemSelecionado;

  while (true) {
    String? input = stdin.readLineSync();

    if (input != null) {
      if (int.tryParse(input) != null) {
        idPersonagemSelecionado = int.parse(input);
        if (!verificaSeIDDoPersonagemExiste(
            idPersonagemSelecionado, totalDePersonagens)) {
          print("Personagem não encontrado! Favor, selecione um existente");
        } else {
          break;
        }
      } else {
        print("Por favor, informe um valor numérico!");
      }
    } else {
      print("Informe um valor válido!");
    }
  }

  return idPersonagemSelecionado;
}

bool verificaSeIDDoPersonagemExiste(
    int idPersonagemSelecionado, int totalDePersonagens) {
  if (idPersonagemSelecionado > 0 &&
      idPersonagemSelecionado <= totalDePersonagens) {
    return true;
  }

  return false;
}

Personagem? instanciarPersonagem({
  required int idPersonagem,
  String nomePersonagem = "Computador",
  required double pontosDeVida,
  String corPersonagem = "Vermelho",
}) {
  switch (idPersonagem) {
    case 1:
      Aguia aguia = Aguia(
          nome: nomePersonagem, pontosDeVida: pontosDeVida, cor: corPersonagem);
      return aguia;
    case 2:
      Cabra cabra = Cabra(
          nome: nomePersonagem, pontosDeVida: pontosDeVida, cor: corPersonagem);
      return cabra;
    case 3:
      Camelo camelo = Camelo(
          nome: nomePersonagem, pontosDeVida: pontosDeVida, cor: corPersonagem);
      return camelo;
    case 4:
      Castor castor = Castor(
          nome: nomePersonagem, pontosDeVida: pontosDeVida, cor: corPersonagem);
      return castor;
    case 5:
      Cavalo cavalo = Cavalo(
          nome: nomePersonagem, pontosDeVida: pontosDeVida, cor: corPersonagem);
      return cavalo;
    case 6:
      Corvo corvo = Corvo(
          nome: nomePersonagem, pontosDeVida: pontosDeVida, cor: corPersonagem);
      return corvo;
    case 7:
      Dromedario dromedario = Dromedario(
          nome: nomePersonagem, pontosDeVida: pontosDeVida, cor: corPersonagem);
      return dromedario;
    case 8:
      Elefante elefante = Elefante(
          nome: nomePersonagem, pontosDeVida: pontosDeVida, cor: corPersonagem);
      return elefante;
    case 9:
      Falcao falcao = Falcao(
          nome: nomePersonagem, pontosDeVida: pontosDeVida, cor: corPersonagem);
      return falcao;
    case 10:
      Galinha galinha = Galinha(
          nome: nomePersonagem, pontosDeVida: pontosDeVida, cor: corPersonagem);
      return galinha;
    case 11:
      Gato gato = Gato(
          nome: nomePersonagem, pontosDeVida: pontosDeVida, cor: corPersonagem);
      return gato;
    case 12:
      Hipopotamo hipopotamo = Hipopotamo(
          nome: nomePersonagem, pontosDeVida: pontosDeVida, cor: corPersonagem);
      return hipopotamo;
    case 13:
      Jacare jacare = Jacare(
          nome: nomePersonagem, pontosDeVida: pontosDeVida, cor: corPersonagem);
      return jacare;
    case 14:
      Leao leao = Leao(
          nome: nomePersonagem, pontosDeVida: pontosDeVida, cor: corPersonagem);
      return leao;
    case 15:
      Papagaio papagaio = Papagaio(
          nome: nomePersonagem, pontosDeVida: pontosDeVida, cor: corPersonagem);
      return papagaio;
    case 16:
      Pato pato = Pato(
          nome: nomePersonagem, pontosDeVida: pontosDeVida, cor: corPersonagem);
      return pato;
    case 17:
      PeixeBoi peixeBoi = PeixeBoi(
          nome: nomePersonagem, pontosDeVida: pontosDeVida, cor: corPersonagem);
      return peixeBoi;
    case 18:
      Rato rato = Rato(
          nome: nomePersonagem, pontosDeVida: pontosDeVida, cor: corPersonagem);
      return rato;
    case 19:
      Sapo sapo = Sapo(
          nome: nomePersonagem, pontosDeVida: pontosDeVida, cor: corPersonagem);
      return sapo;
    case 20:
      Vaca vaca = Vaca(
          nome: nomePersonagem, pontosDeVida: pontosDeVida, cor: corPersonagem);
      return vaca;

    default:
      return null;
  }
}
