import 'package:flutter/material.dart';
import '../../widgets/bloco_estatistica.dart'; // Desafio 7 (veja o widget mais abaixo)

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
          // DESAFIO 2
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Resumo das Observações',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),

            // DESAFIO 8: GridView.count 2x2 (inclui o 3º card do Desafio 1
            // e um 4º bloco para completar a grade)
            // DESAFIO 7: cada célula usa o widget customizado BlocoEstatistica
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

            // DESAFIOS 5 e 6
            Stack(
              clipBehavior: Clip.none,
              children: [
                // DESAFIO 6: Card com elevation 4
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
                            Text('Gavião-Real',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            Text('Avistado no Parque Central',
                                style: TextStyle(color: Colors.grey)),
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
                // DESAFIO 5: segundo selo
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

            // DESAFIO 3: seção "Últimos Registros"
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

            // DESAFIO 4: demonstração de overflow (bloco comentado)
            //
            // ERRO (RenderFlex overflowed by XXX pixels on the right):
            // Row(
            //   children: [
            //     Icon(Icons.place),
            //     Text('Texto muito longo ' * 10),
            //   ],
            // ),
            //
            // CORREÇÃO (envolver o Text com Expanded):
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