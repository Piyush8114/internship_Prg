import 'package:flutter/material.dart';
import 'package:internship/service/api_OTP_service.dart';
import 'model/homePage_model.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiService _apiService = ApiService();
  HomeResponse? _homeData;

  @override
  void initState() {
    super.initState();
    _fetchHomeData();
  }

  Future<void> _fetchHomeData() async {
    HomeResponse? homeData = await _apiService.fetchHomeData();
    setState(() {
      _homeData = homeData;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search here',
            suffixIcon: Icon(Icons.search),
            prefixIcon: Icon(Icons.image, color: Colors.red),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        ],
      ),
      body: _homeData == null
          ? Center(child: CircularProgressIndicator()) // Show a loader while fetching data
          : SingleChildScrollView(
        child: Column(
          children: [
            // Top Banner Slider (Horizontal Scroll)
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _homeData!.banners.length,
                itemBuilder: (context, index) {
                  final banner = _homeData!.banners[index];
                  return _buildBannerCard(banner.imageUrl);
                },
              ),
            ),

            // KYC Banner
            _buildKycBanner(),

            // Category Icons
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCategoryIcon(Icons.phone_android, 'Mobile',
                      Colors.blue.shade500),
                  _buildCategoryIcon(Icons.laptop, 'Laptop',
                      Colors.tealAccent.shade700),
                  _buildCategoryIcon(Icons.camera, 'Camera',
                      Colors.pink.shade500),
                  _buildCategoryIcon(Icons.lightbulb, 'LED',
                      Colors.orange.shade500),
                ],
              ),
            ),

            // Exclusive Products Section
            _buildExclusiveProductsSection(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
      floatingActionButton: _buildFloatingChatButton(),
    );
  }

  // Banner Card for Horizontal Scroll
  Widget _buildBannerCard(String imageUrl) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  // KYC Banner (Static)
  Widget _buildKycBanner() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.cyan, Colors.blue]),
          borderRadius: BorderRadius.all(Radius.circular(20)),
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
              'You need to provide the required documents for your account activation.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
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
    );
  }

  // Exclusive Products Section (Static for now)
  Widget _buildExclusiveProductsSection() {
    return Padding(
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
    );
  }

  // Category Icon Builder
  Widget _buildCategoryIcon(IconData icon, String label, Color color) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 30,
          child: Icon(icon, size: 28, color: Colors.white),
        ),
        SizedBox(height: 8),
        Text(label),
      ],
    );
  }

  // Bottom Navigation Bar
  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categories'),
        BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: 'Deals'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }

  // Floating Chat Button
  Widget _buildFloatingChatButton() {
    return FloatingActionButton.extended(
      backgroundColor: Colors.red.shade500,
      onPressed: () {},
      label: Row(
        children: [
          Icon(Icons.chat, color: Colors.white),
          SizedBox(width: 4),
          Text('Chat', style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}

extension on ApiService {
  fetchHomeData() {}
}
