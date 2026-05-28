
import 'package:flutter/material.dart';
import 'home_screen.dart';

class _PaginaIntro {
  final IconData icone;
  final String titulo;
  final String descricao;
  final Color cor;

  const _PaginaIntro({
    required this.icone,
    required this.titulo,
    required this.descricao,
    required this.cor,
  });
}

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int _paginaAtual = 0;
  final PageController _pageController = PageController();

  final List<_PaginaIntro> _paginas = const [
    _PaginaIntro(
      icone: Icons.public,
      titulo: 'Satélites a seu serviço',
      descricao:
          'O AgroSat Alert conecta dados dos satélites CBERS-4A, Sentinel-1A e GOES-16 diretamente ao seu campo, em tempo real.',
      cor: Color(0xFF1B4332),
    ),
    _PaginaIntro(
      icone: Icons.notifications_active,
      titulo: 'Alertas Inteligentes',
      descricao:
          'Receba notificações sobre chuvas, secas, geadas e ventos antes que eles afetem sua lavoura. Tome decisões com antecedência.',
      cor: Color(0xFF2D6A4F),
    ),
    _PaginaIntro(
      icone: Icons.agriculture,
      titulo: 'Proteja sua safra',
      descricao:
          'O Brasil perde bilhões por falta de informação climática. Com o AgroSat Alert, o produtor rural tem os mesmos dados que grandes cooperativas.',
      cor: Color(0xFF40916C),
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _avancar() {
    if (_paginaAtual < _paginas.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      _irParaHome();
    }
  }

  void _voltar() {
    if (_paginaAtual > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _irParaHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pagina = _paginas[_paginaAtual];

    return Scaffold(
      backgroundColor: pagina.cor,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: _irParaHome,
                child: const Text(
                  'Pular',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ),
            ),

            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _paginas.length,
                onPageChanged: (index) {
                  setState(() => _paginaAtual = index);
                },
                itemBuilder: (context, index) {
                  final p = _paginas[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white30,
                              width: 2,
                            ),
                          ),
                          child: Icon(
                            p.icone,
                            size: 64,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 40),
                        Text(
                          p.titulo,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          p.descricao,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white.withOpacity(0.85),
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_paginas.length, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _paginaAtual == index ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _paginaAtual == index
                        ? Colors.white
                        : Colors.white38,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
            const SizedBox(height: 32),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  if (_paginaAtual > 0)
                    Expanded(
                      child: OutlinedButton(
                        onPressed: _voltar,
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.white54),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text('Voltar'),
                      ),
                    ),
                  if (_paginaAtual > 0) const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: _avancar,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: pagina.cor,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        _paginaAtual == _paginas.length - 1
                            ? 'Começar'
                            : 'Avançar',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
