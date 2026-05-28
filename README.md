# 🌱 AgroSat Alert

Plataforma de monitoramento agrícola via satélite — Global Solution FIAP

---

## 📱 Fluxo do Aplicativo

```
Splash Screen (3s)
      ↓
Tela de Introdução (3 páginas deslizáveis)
      ↓
Home Screen
  ├── Aba Alertas → Lista de alertas com filtros → Tela de Detalhe
  ├── Aba Regiões → Seleção por estado
  └── Aba Sobre   → Informações do projeto
```

---

## 🗂 Estrutura do Projeto

```
lib/
├── main.dart                  # Ponto de entrada
├── models/
│   └── alerta.dart            # Modelo + lista mockada
├── screens/
│   ├── splash_screen.dart     # Tela de splash (0,5pt)
│   ├── intro_screen.dart      # Tela de introdução (1,0pt)
│   ├── home_screen.dart       # Tela principal com filtros
│   ├── detalhe_screen.dart    # Detalhe do alerta
│   ├── mapa_screen.dart       # Alertas por região
│   └── sobre_screen.dart      # Sobre o projeto
└── widgets/
    └── alerta_card.dart       # Componentes reutilizáveis
```

---

## ✅ Requisitos Atendidos

| Requisito | Tela | Pontos |
|---|---|---|
| Tela de Splash com logo | `splash_screen.dart` | 0,5 |
| Tela de Introdução com avançar/voltar | `intro_screen.dart` | 1,0 |
| Navegação entre telas (4+ telas) | Navigator + BottomNav | 2,0 |
| Column, Row, Card, ListView, Scaffold | Em todas as telas | 2,0 |
| Lista mockada com dados do tema | `alerta.dart` (8 alertas) | 1,5 |
| Filtros, seleção, botões funcionais | Home + Detalhe + Regiões | 2,0 |
| Organização e componentes reutilizáveis | `widgets/alerta_card.dart` | 1,0 |

**Total: 10,0 pontos**

---

## 🚀 Como rodar

```bash
flutter pub get
flutter run
```

---

## 📡 Sobre o Projeto

O **AgroSat Alert** conecta dados dos satélites **CBERS-4A**, **Sentinel-1A** e **GOES-16** diretamente ao produtor rural brasileiro, emitindo alertas climáticos antes que eventos afetam as safras.
