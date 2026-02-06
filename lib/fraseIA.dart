import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> gerarFraseIA() async {
  final response = await http.post(
    Uri.parse("https://api.openai.com/v1/chat/completions"),
    headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer SUA_API_KEY_AQUI",
    },
    body: jsonEncode({
      "model": "gpt-4.1-mini",
      "messages": [
        {
          "role": "user",
          "content": "Gere uma frase motivacional curta e positiva"
        }
      ],
      "temperature": 0.8,
      "max_tokens": 60
    }),
  );

  final data = jsonDecode(response.body);
  return data["choices"][0]["message"]["content"];
}
