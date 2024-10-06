import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       leading:IconButton(onPressed: () {}, icon: Icon(Icons.menu)),

        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search here',
            suffixIcon: Icon(Icons.search),
            prefixIcon: Icon(Icons.image,color: Colors.red,),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Banner Slider (Horizontal Scroll)
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildBannerCard('assets/banner1.jpeg'),
                  _buildBannerCard('assets/banner2.jpeg'),
                  _buildBannerCard('assets/banner1.jpeg'),
                  _buildBannerCard('assets/banner2.jpeg'),
                ],
              ),
            ),

            // KYC Banner
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                decoration: BoxDecoration(
                    // color: Colors.blue.shade200,
                  gradient: LinearGradient(colors: [Colors.cyan,Colors.blue]),
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'KYC Pending',
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'You need to provide the required documents for your account activation.',textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 8),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Click Here',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Category Icons
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCategoryIcon(Icons.phone_android, 'Mobile',Colors.blue.shade500),
                  _buildCategoryIcon(Icons.laptop, 'Laptop',Colors.tealAccent.shade700),
                  _buildCategoryIcon(Icons.camera, 'Camera',Colors.pink.shade500),
                  _buildCategoryIcon(Icons.lightbulb, 'LED',Colors.orange.shade500),
                ],
              ),
            ),

            // Exclusive For You Section Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'EXCLUSIVE FOR YOU',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward)),

                ],
              ),
            ),


            // Exclusive Products Horizontal Scroll
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.cyan,Colors.cyanAccent,Colors.blue])
              ),
              child: SizedBox(
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildProductCard('Nokia 8.1 (Iron, 64 GB)', '32% OFF',
                        'assets/nokia.jpeg'),
                    _buildProductCard('Redmi Note 8 (Black, 128 GB)', '14% OFF',
                        'assets/redmi.jpeg'),
                    _buildProductCard('Nokia 8.1 (Iron, 64 GB)', '32% OFF',
                        'assets/nokia.jpeg'),
                    _buildProductCard('Redmi Note 8 (Black, 128 GB)', '14% OFF',
                        'assets/redmi.jpeg'),
                    _buildProductCard('Nokia 8.1 (Iron, 64 GB)', '32% OFF',
                        'assets/nokia.jpeg'),
                    _buildProductCard('Redmi Note 8 (Black, 128 GB)', '14% OFF',
                        'assets/redmi.jpeg'),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20,)
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: 'Deals',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),

      // Floating Chat Button
      floatingActionButton: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30))
        ),
        child: FloatingActionButton(
          backgroundColor: Colors.red.shade500,
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.chat,color: Colors.white,),
              SizedBox(width: 4),
              Text('Chat',style: TextStyle(color: Colors.white),),
            ],
          ),
        ),
      ),

    );
  }

  // Banner Card for Horizontal Scroll
  Widget _buildBannerCard(String imagePath) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  // Category Icon Builder
  Widget _buildCategoryIcon(IconData icon, String label,Color color) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 30,
          child: Icon(icon, size: 28,color: Colors.white,),
        ),
        SizedBox(height: 8),
        Text(label),
      ],
    );
  }

  // Exclusive Product Card Builder
  Widget _buildProductCard(String name, String discount, String imagePath) {
    return Card(

      margin: EdgeInsets.all(8),
      child: Stack(
        children: [
          Container(
            width:200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(imagePath, height: 150, fit: BoxFit.cover),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 14),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          // Positioned discount label on the top right
          Positioned(
            top: 10,
            right: 8,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5,vertical: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.green.shade400,

              ),
              child: Text(
                discount,
                style: TextStyle(
                  fontSize: 6,
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
