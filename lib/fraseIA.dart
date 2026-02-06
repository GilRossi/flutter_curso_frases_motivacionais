import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> gerarFraseIA() async {
  final startTime = DateTime.now();
  print('🔥 [OPENAI] Iniciando chamada à API - ${startTime.toIso8601String()}');

  try {
    print('   → Enviando requisição POST para: https://api.openai.com/v1/chat/completions');
    print('   → Model: gpt-5-mini | Temp: 0.8 | Max tokens: 60');
    print('   → Prompt enviado: "Gere uma frase motivacional curta e positiva"');

    final response = await http.post(
      Uri.parse("https://api.openai.com/v1/chat/completions"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer sk-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
      },
      body: jsonEncode({
        "model": "gpt-5-mini",
        "messages": [
          {
            "role": "user",
            "content": "Gere uma frase motivacional curta e positiva"
          }
        ],
        "temperature": 0.8,
        "max_tokens": 60,
      }),
    );

    final duration = DateTime.now().difference(startTime);
    print('   ← Resposta recebida em ${duration.inMilliseconds} ms (${duration.inSeconds}.${duration.inMilliseconds % 1000}s)');

    print('   → Status code: ${response.statusCode}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final content = data["choices"]?[0]?["message"]?["content"] as String?;

      if (content != null && content.isNotEmpty) {
        print('✅ [OPENAI] Sucesso!');
        print('   Frase gerada: "$content"');
        print('   Uso de tokens → completion: ${data["usage"]?["completion_tokens"]} | prompt: ${data["usage"]?["prompt_tokens"]} | total: ${data["usage"]?["total_tokens"]}');

        return content.trim();
      } else {
        print('⚠️ [OPENAI] Resposta 200, mas conteúdo da frase não encontrado');
        print('   Body completo: ${response.body}');
        throw Exception('Resposta da API sem conteúdo válido');
      }
    } else {
      print('❌ [OPENAI] Erro na requisição');
      print('   Status: ${response.statusCode}');
      print('   Body: ${response.body}');

      if (response.statusCode == 401) {
        print('   → Provável causa: Chave API inválida ou expirada');
      } else if (response.statusCode == 429) {
        print('   → Provável causa: Limite de taxa (rate limit) atingido');
      } else if (response.statusCode == 400) {
        print('   → Provável causa: Parâmetros inválidos (modelo errado, json mal formado, etc.)');
      }

      throw Exception('Erro ${response.statusCode}: ${response.body}');
    }
  } catch (e, stackTrace) {
    final duration = DateTime.now().difference(startTime);
    print('❌ [OPENAI] Exceção durante a chamada');
    print('   Tempo até o erro: ${duration.inMilliseconds} ms');
    print('   Erro: $e');
    print('   StackTrace: $stackTrace');
    rethrow;
  }
}