
import 'package:flutter/material.dart';

class SobreScreen extends StatelessWidget {
  const SobreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                const SizedBox(height: 16),
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1B4332),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: const Icon(
                    Icons.satellite_alt,
                    size: 48,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'AgroSat Alert',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Versão 1.0.0',
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),

          _buildSecao(
            titulo: 'Sobre o Projeto',
            conteudo:
                'O AgroSat Alert é uma plataforma de monitoramento agrícola que utiliza dados de satélites espaciais para emitir alertas climáticos e ambientais em tempo real para produtores rurais brasileiros.',
          ),

          const SizedBox(height: 12),

          _buildSecao(
            titulo: 'Problema que Resolve',
            conteudo:
                'O Brasil perde bilhões de reais anualmente em safras devido à falta de informação climática precisa e acessível no campo. Satélites já captam esses dados em tempo real, mas essas informações não chegam de forma estruturada ao produtor rural.',
          ),

          const SizedBox(height: 12),

          Card(
            elevation: 1,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Satélites Utilizados',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 14),
                  _buildSatelite(
                    nome: 'CBERS-4A',
                    descricao: 'Monitoramento de vegetação e solo',
                    cor: Colors.green,
                  ),
                  const SizedBox(height: 10),
                  _buildSatelite(
                    nome: 'Sentinel-1A',
                    descricao: 'Radar para condições atmosféricas',
                    cor: Colors.blue,
                  ),
                  const SizedBox(height: 10),
                  _buildSatelite(
                    nome: 'GOES-16',
                    descricao: 'Alertas climáticos em tempo real',
                    cor: Colors.orange,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 12),

          Card(
            elevation: 1,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Global Solution — FIAP',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Desenvolvimento Cross Platform\nProf. Heider Pinholi Lopes\nTurmas: 3SIR\n Integrantes: Lucas Lima - 550255\n Bruno Cesar - 554878\n Giovanni Sguizzardi - 565123',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade600,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildSecao({required String titulo, required String conteudo}) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titulo,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              conteudo,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSatelite({
    required String nome,
    required String descricao,
    required Color cor,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: cor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.satellite_alt, color: cor, size: 20),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(nome,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 14)),
            Text(descricao,
                style:
                    TextStyle(fontSize: 12, color: Colors.grey.shade500)),
          ],
        ),
      ],
    );
  }
}
