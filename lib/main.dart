import 'package:flutter/material.dart';
// TODO Desafio 7: Importar o widget customizado criado em lib/widgets/bloco_estatistica.dart
import 'widgets/bloco_estatistica.dart';

void main() {
  runApp(const MeuLayoutApp());
}

class MeuLayoutApp extends StatelessWidget {
  const MeuLayoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PPDM - Avaliação 02 (Layout Widgets)',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const TelaDashboard(),
    );
  }
}

class TelaDashboard extends StatelessWidget {
  const TelaDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PPDM - Dashboard de Observações'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // ===================================================================
          // 📍 DESAFIO 2 (1,0 ponto): 
          // Alterar o crossAxisAlignment de .start para CrossAxisAlignment.center
          // ===================================================================
          crossAxisAlignment: CrossAxisAlignment.center, // FIXME: Alterar para CrossAxisAlignment.center
          children: [
            const Text(
              'Resumo das Observações',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),

            // ===================================================================
            // 📍 DESAFIO 1 (1,5 ponto) & DESAFIO 8 (3,0 pontos):
            // Desafio 1: Adicionar o 3º Card (Icons.camera_alt, '45', 'Fotos') com Expanded.
            // Desafio 8: Refatorar esta seção usando GridView.count (grade 2x2).
            // ===================================================================
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.3,
              children: [
                BlocoEstatistica(
                  icone: Icons.flutter_dash,
                  valor: '124',
                  rotulo: 'Aves Vistas',
                  cor: Colors.teal.shade100,
                ),
                BlocoEstatistica(
                  icone: Icons.place,
                  valor: '18',
                  rotulo: 'Locais Visitados',
                  cor: Colors.teal.shade50,
                ),
                // TODO [Desafio 1]: Adicionar aqui o terceiro Card com Expanded (Ícone: Icons.camera_alt, '45', 'Fotos')
                BlocoEstatistica(
                  icone: Icons.camera_alt,
                  valor: '45',
                  rotulo: 'Fotos',
                  cor: Colors.teal.shade100,
                ),
                BlocoEstatistica(
                  icone: Icons.star,
                  valor: '7',
                  rotulo: 'Espécies Raras',
                  cor: Colors.teal.shade50,
                ),
              ],
            ),
            const SizedBox(height: 24.0),

            const Text(
              'Destaque da Semana',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),

            // ===================================================================
            // 📍 DESAFIO 5 (2,0 pontos) & DESAFIO 6 (1,5 ponto):
            // Desafio 5: Adicionar o 2º selo no Stack (bottom: -8, left: -8)
            //            com texto "Confirmado" e cor verde (Colors.green).
            // Desafio 6: Substituir o Container abaixo por um Card(elevation: 4).
            // ===================================================================
            Stack(
              clipBehavior: Clip.none,
              children: [
                // TODO [Desafio 6]: Substituir o Container simples por um Card do Material com elevation: 4
                Card(
                  elevation: 4,
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        const Icon(Icons.star, size: 48, color: Colors.amber),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Gavião-Real', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            Text('Avistado no Parque Central', style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: -8,
                  right: -8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Raro',
                      style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                // TODO [Desafio 5]: Adicionar segundo Positioned no canto inferior esquerdo:
                // Positioned(bottom: -8, left: -8, child: Container(color: Colors.green, child: Text('Confirmado')))
                Positioned(
                  bottom: -8,
                  left: -8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Confirmado',
                      style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24.0),

            // ===================================================================
            // 📍 DESAFIO 3 (2,0 pontos):
            // Criar a seção "Últimos Registros" com Container, Row, ícone de lista,
            // texto e botão/ícone com MainAxisAlignment.spaceBetween.
            // ===================================================================
            // TODO [Desafio 3]: Implementar a seção "Últimos Registros" aqui
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.teal.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.teal.shade200),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.list_alt, color: Colors.teal),
                      SizedBox(width: 12),
                      Text(
                        'Últimos Registros',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios, size: 18),
                    color: Colors.teal,
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            // ===================================================================
            // 📍 DESAFIO 4 (1,5 ponto):
            // Demonstrar/comprovar a ocorrência e correção de um erro de overflow
            // (RenderFlex overflow) via prints ou bloco comentado.
            // ===================================================================

            // ERRO:
            // Row(
            //   children: [
            //     Icon(Icons.place),
            //     Text('Texto muito longo ' * 10),
            //   ],
            // ),
            //
            // CORREÇÃO:
            // Row(
            //   children: [
            //     Icon(Icons.place),
            //     Expanded(child: Text('Texto muito longo ' * 10)),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}