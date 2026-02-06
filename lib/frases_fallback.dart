import 'dart:math';

class FrasesFallback {
  static final _random = Random();

  static const List<String> frases = [
    "Respira fundo. Tudo começa de novo agora.",
    "Você chegou até aqui, e isso já diz muito.",
    "Nem todo dia é fácil, mas todo dia ensina algo.",
    "Continue. Mesmo devagar, você está indo.",
    "O simples fato de tentar já é coragem.",
    "Hoje pode ser o começo de algo melhor.",
    "Você não precisa vencer hoje, só não desistir.",
    "Pequenos passos também levam longe.",
    "A calma também é uma forma de força.",
    "Você é mais capaz do que imagina.",

    "Dias difíceis também passam.",
    "Nem tudo precisa fazer sentido agora.",
    "Confie no processo, mesmo sem entender.",
    "O amanhã agradece o esforço de hoje.",
    "Você não está atrasado, está no seu tempo.",
    "Seja gentil consigo mesmo.",
    "Tudo bem pausar, não é desistir.",
    "Você ainda vai se orgulhar disso.",
    "A persistência muda destinos.",
    "A esperança também se treina.",

    "Um passo de cada vez é suficiente.",
    "Seu esforço não é invisível.",
    "Você não chegou até aqui por acaso.",
    "O que parece lento hoje será progresso amanhã.",
    "A constância vence o talento.",
    "Você está aprendendo, e isso vale muito.",
    "Coragem não é ausência de medo.",
    "Até os dias nublados têm propósito.",
    "Seu melhor hoje já é o bastante.",
    "Acredite um pouco mais em você.",

    "Tudo começa quando você decide continuar.",
    "O cansaço passa, o orgulho fica.",
    "Não se compare. Cada caminho é único.",
    "Persistir também é se amar.",
    "Você está mais perto do que pensa.",
    "Não desista no meio da história.",
    "A evolução mora na repetição.",
    "Você pode recomeçar quantas vezes quiser.",
    "A paciência constrói resultados sólidos.",
    "Continue mesmo sem aplausos.",

    "Você não precisa provar nada para ninguém.",
    "Seu tempo vai chegar.",
    "A disciplina cria liberdade.",
    "Você é mais forte do que ontem.",
    "Nem todo progresso faz barulho.",
    "Confie: você está evoluindo.",
    "O impossível só demora um pouco mais.",
    "Você está fazendo o melhor que pode.",
    "Isso também é crescimento.",
    "A consistência muda tudo.",

    "Seja firme, mas seja gentil.",
    "Você ainda vai agradecer por não ter parado.",
    "Cada tentativa conta.",
    "Nada cresce sem esforço.",
    "A vitória começa na decisão.",
    "A jornada também importa.",
    "Não se cobre tanto.",
    "Você está no caminho certo.",
    "O progresso é invisível antes de aparecer.",
    "Você é capaz de mais do que imagina.",

    "Tudo melhora quando você continua.",
    "Persistir é um ato de fé.",
    "A mudança começa em você.",
    "Seu esforço vai florescer.",
    "Não pare agora.",
    "Você está aprendendo a vencer.",
    "A constância constrói milagres.",
    "Continue mesmo nos dias difíceis.",
    "Você ainda vai chegar lá.",
    "Acredite no processo."
  ];

  static String fraseAleatoria() {
    return frases[_random.nextInt(frases.length)];
  }
}
