import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(  // 1.- primer widget de la aplicación
      title: 'Aplicación con Imágenes y Navegación',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar( // 2.- segunda widget de la aplicación
          title: const Text('Aplicación con Tabs'),
          actions: [
            IconButton( // 3.- tercer widget de la aplicación
              icon: const Icon(Icons.search),
              onPressed: () {
              },
            ),
          ],
          bottom: const TabBar( // 5.- quinto widget de la aplicación
            tabs: [
              Tab(icon: Icon(Icons.home), text: "Inicio"),
              Tab(icon: Icon(Icons.image), text: "Galería"),
              Tab(icon: Icon(Icons.settings), text: "Ajustes"),
            ],
          ),
        ),
        body:  TabBarView( 
          children: [
            const MaterialHomePage(),  
            GalleryPage(),    
            const CupertinoSettingsPage(), 
          ],
        ),
        floatingActionButton: FloatingActionButton( // 4.- cuarto widget de la aplicación
          onPressed: () {
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class MaterialHomePage extends StatelessWidget {
  const MaterialHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Página de Inicio con Material Widgets'));
  }
}

class GalleryPage extends StatelessWidget {
  final List<String> imageUrls = [
    'https://png.pngtree.com/thumb_back/fh260/background/20230527/pngtree-the-small-kid-looks-sad-while-sitting-on-the-ground-image_2681004.jpg',
    'https://r-charts.com/es/miscelanea/procesamiento-imagenes-magick_files/figure-html/color-fondo-imagen-r.png',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTf_bN0Jy1nqwYIP8qvrgHBl8pDhv6YrFa08w&s',
  ];

   GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              return Card( // 6.- sexto widget de la aplicación
                margin: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image.network(imageUrls[index]),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Imagen ${index + 1}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class CupertinoSettingsPage extends StatelessWidget {
  const CupertinoSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(  // 7.- septimo widget de la aplicación
      navigationBar: const CupertinoNavigationBar( // 8.- octavo widget de la aplicación
        middle: Text('Página de Ajustes'),
      ),
      child: Center(
        child: CupertinoButton( // 9.- noveno widget de la aplicación
          child: const Text('Ajustes'),
          onPressed: () {
            // Acción del botón
          },
        ),
      ),
    );
  }
}
