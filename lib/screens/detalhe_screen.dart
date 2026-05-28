
import 'package:flutter/material.dart';
import '../models/alerta.dart';
import '../widgets/alerta_card.dart';

class DetalheScreen extends StatefulWidget {
  final Alerta alerta;

  const DetalheScreen({super.key, required this.alerta});

  @override
  State<DetalheScreen> createState() => _DetalheScreenState();
}

class _DetalheScreenState extends State<DetalheScreen> {
  bool _marcadoComoLido = false;

  Color _getCorSeveridade() {
    switch (widget.alerta.severidade) {
      case 'alta':
        return Colors.red;
      case 'media':
        return Colors.orange;
      default:
        return Colors.green;
    }
  }

  IconData _getIcone() {
    switch (widget.alerta.tipo) {
      case 'chuva':
        return Icons.water_drop;
      case 'seca':
        return Icons.wb_sunny;
      case 'vento':
        return Icons.air;
      case 'geada':
        return Icons.ac_unit;
      default:
        return Icons.check_circle;
    }
  }

  String _getRecomendacao() {
    switch (widget.alerta.tipo) {
      case 'chuva':
        return 'Suspenda a aplicação de defensivos agrícolas. Reforce a drenagem dos canteiros e verifique estufas e estruturas.';
      case 'seca':
        return 'Acione o sistema de irrigação. Monitore o índice de estresse hídrico das culturas diariamente.';
      case 'vento':
        return 'Proteja culturas altas. Evite pulverizações. Verifique estruturas de suporte e tutoramentos.';
      case 'geada':
        return 'Proteja mudas jovens com cobertura. Ative nebulizadores se disponíveis. Evite irrigação por aspersão durante a geada.';
      default:
        return 'Condições dentro do normal. Bom período para operações de plantio, colheita e aplicação de insumos.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B4332),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'AgroSat Alert',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              color: _getCorSeveridade().withOpacity(0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(_getIcone(), color: _getCorSeveridade(), size: 32),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          widget.alerta.titulo,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: _getCorSeveridade(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: _getCorSeveridade().withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Severidade: ${widget.alerta.severidade.toUpperCase()}',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: _getCorSeveridade(),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Informações',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(height: 20),
                      InfoItem(
                        icone: Icons.satellite_alt,
                        label: 'Satélite',
                        valor: widget.alerta.satelite,
                        cor: Colors.indigo,
                      ),
                      const SizedBox(height: 14),
                      InfoItem(
                        icone: Icons.location_on,
                        label: 'Região',
                        valor: widget.alerta.regiao,
                        cor: Colors.teal,
                      ),
                      const SizedBox(height: 14),
                      InfoItem(
                        icone: Icons.calendar_today,
                        label: 'Data',
                        valor: widget.alerta.data,
                        cor: Colors.deepOrange,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Descrição do Alerta',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.alerta.descricao,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                elevation: 1,
                color: Colors.green.shade50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.lightbulb, color: Colors.green, size: 20),
                          SizedBox(width: 8),
                          Text(
                            'Recomendação',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _getRecomendacao(),
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    setState(() => _marcadoComoLido = !_marcadoComoLido);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          _marcadoComoLido
                              ? 'Alerta marcado como lido ✓'
                              : 'Marcação removida',
                        ),
                        backgroundColor: const Color(0xFF1B4332),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  icon: Icon(
                    _marcadoComoLido ? Icons.check_circle : Icons.check_circle_outline,
                  ),
                  label: Text(
                    _marcadoComoLido ? 'Marcado como lido' : 'Marcar como lido',
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _marcadoComoLido
                        ? Colors.grey
                        : const Color(0xFF1B4332),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
