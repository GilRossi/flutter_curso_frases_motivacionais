# 💬 Frases Motivacionais - Flutter

Aplicativo simples em **Flutter** que exibe frases motivacionais aleatórias. Ideal como exercício de UI/UX e manipulação básica de estado em Flutter — o usuário aperta um botão e recebe uma nova frase. Projeto leve e fácil de estender com recursos como som, persistência e internacionalização.

---

## 🚀 Tecnologias Utilizadas

* **Flutter** (SDK)
* **Dart**
* **Material Design**
* Stateful widgets (`setState`) para gerenciamento de estado simples

---

## 📂 Estrutura do Projeto

```
frases_motivacionais/
│
├── android/                      # código Android gerado pelo Flutter
├── ios/                          # código iOS gerado pelo Flutter
├── lib/
│   └── main.dart                 # Aplicação: Home widget com lógica de frases
├── images/
│   └── c10.png                   # Imagem usada na interface (assets)
├── pubspec.yaml                   # Declaração de dependências e assets
└── README.md
```

Exemplo relevante de arquivo principal: `lib/main.dart` (classe `Home`) — gera frases a partir de uma lista, usa `Random()` e atualiza UI com `setState()`.

---

## 🛠 Princípios Aplicados

### Clean Code
* Funções com responsabilidade única (gerar frase separada da construção da UI).
* Nomes claros e autoexplicativos (`_gerarFrase`, `_frases`, `_fraseGerada`).
* Estrutura de projeto simples e direta.

### SOLID (aplicado de forma prática)
* Single Responsibility: widgets e funções com responsabilidades limitadas.
* Open/Closed e extensibilidade: fácil adicionar novas frases ou recursos (áudio, histórico).
* Manter lógica de negócio simples dentro do `State` para facilitar testes e refatorações.

### Padrões de Projeto / Arquitetura
* Composição de widgets do Flutter para separar responsabilidades visuais.
* Uso de StatefulWidget para gerenciamento local de estado (padrão simples para pequenos apps).

---

## 🎯 Funcionalidades Principais

* Exibição de uma frase motivacional aleatória.
* Imagem ilustrativa (assets/images/c10.png).
* Botão "Nova Frase" que sorteia e exibe outra frase instantaneamente.
* Texto formatado com estilo e alinhamento agradável.

---

## 💻 Como Executar

Pré-requisitos:
* Flutter SDK instalado e configurado (PATH)
* Emulador Android ou dispositivo físico conectado
* Android Studio / VS Code (opcional, recomendado para desenvolvimento)

1. Clonar o repositório:
```bash
git clone https://github.com/GilRossi/flutter_curso_frases_motivacionais.git
cd flutter_curso_frases_motivacionais
```

2. Instalar dependências:
```bash
flutter pub get
```

3. Rodar no emulador ou dispositivo:
```bash
flutter run
```

4. Gerar APK de release:
```bash
flutter build apk --release
```

Via IDE:
* Abra o projeto no Android Studio ou VS Code.
* Execute o main (`lib/main.dart`) com o botão Run/Play.

---

## 🔧 Configurar assets (pubspec.yaml)

Garanta que o `pubspec.yaml` inclua a referência aos assets. Exemplo:

```yaml
flutter:
  assets:
    - images/c10.png
```

Depois rode `flutter pub get` para registrar os assets no projeto.

---

## 🎮 Como Jogar / Usar

1. Abra o aplicativo.
2. Toque em "Nova Frase".
3. Leia a frase exibida no centro da tela.
4. Repita para treinar e se inspirar.

Feedback visual:
* Texto em estilo itálico, tamanho legível e alinhamento justificado para boa leitura.

---

## 📊 Fluxo da Aplicação

```
Inicialização → Carrega lista de frases e assets
      ↓
Tela principal exibida com imagem e frase inicial
      ↓
Usuário clica em "Nova Frase" → _gerarFrase() escolhe aleatoriamente
      ↓
setState() atualiza UI → nova frase exibida
      ↓
Repetir
```

---

## 🧪 Recursos de Aprendizado

* Prática de gerenciamento de estado simples com `StatefulWidget`.
* Uso de assets (imagens) no Flutter.
* Estruturação básica de aplicações Flutter para iniciantes.
* Boas práticas de UI (espaçamento, tipografia e acessibilidade básica).

---

## 📚 Próximos Passos / Melhorias Sugeridas

* Adicionar persistência (salvar frases favoritas com SharedPreferences ou SQLite).
* Implementar sons ao trocar a frase (ex.: áudio curto ao pressionar o botão).
* Internacionalização (i18n) para suportar múltiplos idiomas.
* Testes unitários e de widget.
* Adicionar animações suaves ao trocar frases.
* Adicionar funcionalidade de compartilhamento (share) das frases.
* Transformar a lista de frases em fonte externa (arquivo JSON ou API).

---

## 👨‍💻 Autor

**Gil Rossi Aguiar**  
📧 [gil.rossi.aguiar@hotmail.com](mailto:gil.rossi.aguiar@hotmail.com)  
🐙 [GitHub — GilRossi](https://github.com/GilRossi)

---