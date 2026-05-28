
class Alerta {
  final String id;
  final String titulo;
  final String descricao;
  final String satelite;
  final String tipo; // 'chuva', 'seca', 'vento', 'geada', 'normal'
  final String regiao;
  final String data;
  final String severidade; // 'baixa', 'media', 'alta'

  Alerta({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.satelite,
    required this.tipo,
    required this.regiao,
    required this.data,
    required this.severidade,
  });
}

final List<Alerta> alertasMock = [
  Alerta(
    id: '1',
    titulo: 'Chuva Intensa Prevista',
    descricao: 'Satélite GOES-16 detectou formação de nuvens de tempestade na região. Precipitação esperada acima de 80mm nas próximas 24h. Recomenda-se suspender aplicação de defensivos.',
    satelite: 'GOES-16',
    tipo: 'chuva',
    regiao: 'Mato Grosso do Sul',
    data: '27/05/2026',
    severidade: 'alta',
  ),
  Alerta(
    id: '2',
    titulo: 'Déficit Hídrico Detectado',
    descricao: 'Imagens do CBERS-4A indicam índice de vegetação abaixo do normal na área. Solo com umidade crítica. Atenção ao estresse hídrico das culturas de soja.',
    satelite: 'CBERS-4A',
    tipo: 'seca',
    regiao: 'Goiás',
    data: '26/05/2026',
    severidade: 'alta',
  ),
  Alerta(
    id: '3',
    titulo: 'Vento Forte nas Próximas Horas',
    descricao: 'Sentinel-1A registrou padrão atmosférico indicando rajadas de vento acima de 60 km/h. Risco de tombamento para culturas altas como milho e cana.',
    satelite: 'Sentinel-1A',
    tipo: 'vento',
    regiao: 'Paraná',
    data: '27/05/2026',
    severidade: 'media',
  ),
  Alerta(
    id: '4',
    titulo: 'Risco de Geada',
    descricao: 'Temperatura da superfície registrada pelo GOES-16 abaixo de 4°C. Alta probabilidade de geada nas madrugadas dos próximos 3 dias. Proteja mudas e culturas sensíveis.',
    satelite: 'GOES-16',
    tipo: 'geada',
    regiao: 'Rio Grande do Sul',
    data: '25/05/2026',
    severidade: 'alta',
  ),
  Alerta(
    id: '5',
    titulo: 'Condições Favoráveis',
    descricao: 'Análise do CBERS-4A indica umidade do solo ideal e temperatura estável. Bom período para plantio e aplicação de insumos na região.',
    satelite: 'CBERS-4A',
    tipo: 'normal',
    regiao: 'São Paulo',
    data: '27/05/2026',
    severidade: 'baixa',
  ),
  Alerta(
    id: '6',
    titulo: 'Chuva Moderada Esperada',
    descricao: 'Sentinel-1A detectou frente fria se aproximando. Precipitação entre 20mm e 40mm nas próximas 48h. Condições adequadas para irrigação suplementar.',
    satelite: 'Sentinel-1A',
    tipo: 'chuva',
    regiao: 'Minas Gerais',
    data: '26/05/2026',
    severidade: 'media',
  ),
  Alerta(
    id: '7',
    titulo: 'Seca Prolongada',
    descricao: 'GOES-16 confirma ausência de chuvas por mais de 15 dias na região. Índice de aridez crítico. Acionamento de sistema de irrigação emergencial recomendado.',
    satelite: 'GOES-16',
    tipo: 'seca',
    regiao: 'Bahia',
    data: '24/05/2026',
    severidade: 'alta',
  ),
  Alerta(
    id: '8',
    titulo: 'Condições Normais',
    descricao: 'Monitoramento do CBERS-4A indica plantação com bom índice de vegetação (NDVI 0.72). Culturas em desenvolvimento esperado para a época.',
    satelite: 'CBERS-4A',
    tipo: 'normal',
    regiao: 'Mato Grosso',
    data: '27/05/2026',
    severidade: 'baixa',
  ),
];
