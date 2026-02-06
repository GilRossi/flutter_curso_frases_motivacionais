import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenAIService {
  static const String _baseUrl = "https://api.openai.com/v1/chat/completions";
  static const String _model = "gpt-4o-mini"; // corrigido (gpt-4.0-mini não existe)

  static Future<String> gerarFrase() async {
    final startTime = DateTime.now();
    print('🔥 [OpenAI] Iniciando geração de frase - ${startTime.toIso8601String()}');

    try {
      print('   → POST $_baseUrl');
      print('   → Modelo: $_model');
      print('   → Temperatura: 0.8 | Max tokens: 60');
      print('   → Prompt: "Gere uma frase motivacional curta e positiva"');

      final response = await http
          .post(
        Uri.parse(_baseUrl),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer SUA_API_KEY_AQUI",
        },
        body: jsonEncode({
          "model": _model,
          "messages": [
            {
              "role": "user",
              "content": "Gere uma frase motivacional curta e positiva"
            }
          ],
          "temperature": 0.8,
          "max_tokens": 60,
        }),
      )
          .timeout(const Duration(seconds: 20)); // adicionado timeout para evitar travamento

      final duration = DateTime.now().difference(startTime);
      print('   ← Resposta recebida em ${duration.inMilliseconds} ms (${duration.inSeconds}.${(duration.inMilliseconds % 1000).toString().padLeft(3, '0')}s)');

      print('   → Status: ${response.statusCode}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        final content = data["choices"]?[0]?["message"]?["content"] as String?;
        if (content == null || content.trim().isEmpty) {
          print('⚠️ Resposta 200, mas conteúdo vazio ou inválido');
          print('   Body completo: ${response.body}');
          throw Exception("Resposta da API sem conteúdo válido");
        }

        print('✅ Sucesso!');
        print('   Frase: "$content"');
        print('   Tokens usados → prompt: ${data["usage"]?["prompt_tokens"] ?? "?"} | '
            'completion: ${data["usage"]?["completion_tokens"] ?? "?"} | '
            'total: ${data["usage"]?["total_tokens"] ?? "?"}');

        return content.trim();
      } else {
        print('❌ Erro na API');
        print('   Status: ${response.statusCode}');
        print('   Body: ${response.body}');

        // Mensagens de erro mais amigáveis
        if (response.statusCode == 401) {
          print('   → Causa provável: Chave API inválida, expirada ou mal formatada');
        } else if (response.statusCode == 429) {
          print('   → Causa provável: Limite de requisições (rate limit) atingido');
        } else if (response.statusCode == 400) {
          print('   → Causa provável: Parâmetros inválidos (modelo errado, JSON malformado, etc.)');
        } else if (response.statusCode == 404) {
          print('   → Causa provável: Modelo não encontrado');
        }

        throw Exception("Erro OpenAI ${response.statusCode}: ${response.body}");
      }
    } catch (e, stackTrace) {
      final duration = DateTime.now().difference(startTime);
      print('❌ Exceção durante chamada à OpenAI');
      print('   Tempo até erro: ${duration.inMilliseconds} ms');
      print('   Erro: $e');
      print('   StackTrace: $stackTrace');

      rethrow; // permite que o chamador também capture o erro
    }
  }
}