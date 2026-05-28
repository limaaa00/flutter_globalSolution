// lib/widgets/alerta_card.dart

import 'package:flutter/material.dart';
import '../models/alerta.dart';

// -----------------------------------------------
// Widget reutilizável: Card de alerta
// -----------------------------------------------
class AlertaCard extends StatelessWidget {
  final Alerta alerta;
  final VoidCallback onTap;

  const AlertaCard({
    super.key,
    required this.alerta,
    required this.onTap,
  });

  // Retorna ícone baseado no tipo do alerta
  IconData _getIcone() {
    switch (alerta.tipo) {
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

  // Retorna cor baseada na severidade
  Color _getCorSeveridade() {
    switch (alerta.severidade) {
      case 'alta':
        return Colors.red;
      case 'media':
        return Colors.orange;
      default:
        return Colors.green;
    }
  }

  // Retorna cor de fundo do ícone
  Color _getCorIcone() {
    switch (alerta.tipo) {
      case 'chuva':
        return Colors.blue.shade100;
      case 'seca':
        return Colors.orange.shade100;
      case 'vento':
        return Colors.cyan.shade100;
      case 'geada':
        return Colors.lightBlue.shade100;
      default:
        return Colors.green.shade100;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              // Ícone do tipo
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: _getCorIcone(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  _getIcone(),
                  color: _getCorSeveridade(),
                  size: 28,
                ),
              ),
              const SizedBox(width: 12),
              // Informações
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            alerta.titulo,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        // Badge de severidade
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: _getCorSeveridade().withOpacity(0.15),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            alerta.severidade.toUpperCase(),
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: _getCorSeveridade(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      alerta.descricao,
                      style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.satellite_alt, size: 12, color: Colors.grey.shade500),
                        const SizedBox(width: 4),
                        Text(
                          alerta.satelite,
                          style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
                        ),
                        const SizedBox(width: 10),
                        Icon(Icons.location_on, size: 12, color: Colors.grey.shade500),
                        const SizedBox(width: 4),
                        Text(
                          alerta.regiao,
                          style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}

// -----------------------------------------------
// Widget reutilizável: Chip de filtro
// -----------------------------------------------
class FiltroChip extends StatelessWidget {
  final String label;
  final bool selecionado;
  final VoidCallback onTap;
  final Color cor;

  const FiltroChip({
    super.key,
    required this.label,
    required this.selecionado,
    required this.onTap,
    required this.cor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: selecionado ? cor : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: selecionado ? Colors.white : Colors.grey.shade700,
          ),
        ),
      ),
    );
  }
}

// -----------------------------------------------
// Widget reutilizável: Info item para tela de detalhe
// -----------------------------------------------
class InfoItem extends StatelessWidget {
  final IconData icone;
  final String label;
  final String valor;
  final Color cor;

  const InfoItem({
    super.key,
    required this.icone,
    required this.label,
    required this.valor,
    required this.cor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: cor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icone, color: cor, size: 20),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: TextStyle(fontSize: 11, color: Colors.grey.shade500)),
            Text(valor, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          ],
        ),
      ],
    );
  }
}
