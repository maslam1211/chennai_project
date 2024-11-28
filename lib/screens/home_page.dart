import 'package:chennai_restaurant_project/widgets/about.dart';
import 'package:chennai_restaurant_project/widgets/footer.dart';
import 'package:chennai_restaurant_project/widgets/header.dart';
import 'package:chennai_restaurant_project/widgets/inside.dart';
import 'package:chennai_restaurant_project/widgets/menu.dart';
import 'package:chennai_restaurant_project/widgets/reviews.dart';
import 'package:chennai_restaurant_project/widgets/welcome_section.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          
          SliverAppBar(
            backgroundColor:
                Colors.transparent, 
            pinned: true, 
            expandedHeight: 100.0, 
            flexibleSpace: FlexibleSpaceBar(
              background: Header(), 
            ),
          ),

          
          SliverList(
            delegate: SliverChildListDelegate(
              [
                WelcomeSection(),
                AboutSection(),
                const InsideSection(),
                MenuSection(),
                Reviews(),
                SizedBox(height: 20),
                Footer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
