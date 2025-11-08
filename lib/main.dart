import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const SuperStoreApp());

class SuperStoreApp extends StatelessWidget {
  const SuperStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cartsy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: GoogleFonts.poppinsTextTheme(),
        useMaterial3: true,
      ),
      home: const HomeScreen(),

    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Cartsy',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Row(
              children: const [
                Icon(Icons.location_on_outlined, size: 18),
                SizedBox(width: 4),
                Text('DHA Phase 6 Branch',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                Icon(Icons.keyboard_arrow_down, size: 18)
              ],
            )

          ],

        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'Image/banner.jpeg',
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search products, brands & more',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Categories
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Categories',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => const categories(),
                    ),
                  );
                }, child: const Text('See all'))
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryChip(title: "Electronics", icon: Icons.devices),
                  CategoryChip(title: "Groceries", icon: Icons.shopping_cart),
                  CategoryChip(title: "Fashion", icon: Icons.checkroom),
                  CategoryChip(title: "Health & Beauty", icon: Icons.favorite),
                ],
              ),
            ),

            const SizedBox(height: 20),
            // Deals Grid
            const Text("Today's Deals",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                4,
                    (i) => DealCard(
                  imagePath: 'Image/product${i + 1}.jpeg',
                  title: 'Product ${i + 1}',
                  price: '\$${(i + 1) * 10}',
                ),
              ),
            ),
          ],
        ),


      ),


    );
  }
}


class CategoryChip extends StatelessWidget {
  final String title;
  final IconData icon;
  const CategoryChip({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.deepPurple, size: 28),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}


class DealCard extends StatelessWidget {
  final String imagePath, title, price;
  const DealCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
              const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(imagePath,
                  width: double.infinity, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 4),
                Text(price,
                    style: const TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class categories extends StatelessWidget{
  const categories({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Categories")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (context) => const HomeScreen(),
              ),
            );
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }

}