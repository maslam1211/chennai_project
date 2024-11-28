import 'package:chennai_restaurant_project/provider/menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class MenuSection extends StatefulWidget {
  const MenuSection({super.key});

  @override
  State<MenuSection> createState() => _MenuSectionState();
}

class _MenuSectionState extends State<MenuSection> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MenuProvider>(context, listen: false).loadMenuItems();
    });

    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      
      final menuProvider = Provider.of<MenuProvider>(context, listen: false);
      if (!menuProvider.isLoading) {
        menuProvider.loadMenuItems();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    final menuItems = menuProvider.menuItems;
    final isLoading = menuProvider.isLoading;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Our Menu',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          
          GridView.builder(
            controller: _scrollController,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: menuItems.length +
                (isLoading ? 1 : 0), 
            itemBuilder: (context, index) {
              if (index == menuItems.length && isLoading) {
                
                return const Center(child: CircularProgressIndicator());
              }

              return _MenuItem(
                title: menuItems[index],
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text('You clicked on ${menuItems[index]}')),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class _MenuItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _MenuItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
