
import 'package:flutter/material.dart';
import '../models/alerta.dart';
import '../widgets/alerta_card.dart';
import 'detalhe_screen.dart';
import 'mapa_screen.dart';
import 'sobre_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _abaSelecionada = 0;

  String _filtroSelecionado = 'todos';

  final List<Map<String, dynamic>> _filtros = [
    {'label': 'Todos', 'valor': 'todos', 'cor': Colors.blueGrey},
    {'label': '🌧 Chuva', 'valor': 'chuva', 'cor': Colors.blue},
    {'label': '☀️ Seca', 'valor': 'seca', 'cor': Colors.orange},
    {'label': '💨 Vento', 'valor': 'vento', 'cor': Colors.cyan},
    {'label': '❄️ Geada', 'valor': 'geada', 'cor': Colors.lightBlue},
    {'label': '✅ Normal', 'valor': 'normal', 'cor': Colors.green},
  ];

  List<Alerta> get _alertasFiltrados {
    if (_filtroSelecionado == 'todos') return alertasMock;
    return alertasMock
        .where((a) => a.tipo == _filtroSelecionado)
        .toList();
  }

  int get _totalAlertas {
    return alertasMock
        .where((a) => a.severidade == 'alta')
        .length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B4332),
        title: Row(
          children: [
            const Icon(Icons.satellite_alt, color: Colors.white, size: 22),
            const SizedBox(width: 8),
            const Text(
              'AgroSat Alert',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications, color: Colors.white),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('$_totalAlertas alertas críticos ativos'),
                      backgroundColor: Colors.red,
                    ),
                  );
                },
              ),
              if (_totalAlertas > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '$_totalAlertas',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: _abaSelecionada == 0
          ? _buildTelaAlertas()
          : _abaSelecionada == 1
              ? const MapaScreen()
              : const SobreScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _abaSelecionada,
        selectedItemColor: const Color(0xFF1B4332),
        onTap: (index) => setState(() => _abaSelecionada = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            activeIcon: Icon(Icons.notifications),
            label: 'Alertas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            activeIcon: Icon(Icons.map),
            label: 'Regiões',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            activeIcon: Icon(Icons.info),
            label: 'Sobre',
          ),
        ],
      ),
    );
  }

  Widget _buildTelaAlertas() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF1B4332), Color(0xFF40916C)],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Monitoramento Ativo',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    '${alertasMock.length} alertas',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '$_totalAlertas críticos',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              const Text(
                'Satélites: GOES-16 · CBERS-4A · Sentinel-1A',
                style: TextStyle(color: Colors.white60, fontSize: 11),
              ),
            ],
          ),
        ),

        SizedBox(
          height: 38,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _filtros.length,
            itemBuilder: (context, index) {
              final filtro = _filtros[index];
              final selecionado = _filtroSelecionado == filtro['valor'];
              return FiltroChip(
                label: filtro['label'],
                selecionado: selecionado,
                cor: filtro['cor'],
                onTap: () {
                  setState(() => _filtroSelecionado = filtro['valor']);
                },
              );
            },
          ),
        ),
        const SizedBox(height: 8),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Text(
            '${_alertasFiltrados.length} resultado(s)',
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
        ),

        Expanded(
          child: _alertasFiltrados.isEmpty
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_circle, color: Colors.green, size: 48),
                      SizedBox(height: 12),
                      Text('Nenhum alerta nessa categoria'),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: _alertasFiltrados.length,
                  itemBuilder: (context, index) {
                    final alerta = _alertasFiltrados[index];
                    return AlertaCard(
                      alerta: alerta,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DetalheScreen(alerta: alerta),
                          ),
                        );
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }
}
