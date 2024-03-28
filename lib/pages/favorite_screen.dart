import 'package:flutter/material.dart';
import 'package:flutter_application_university_project/providers/favorite_providers.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build (BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final finalList = provider.favorites;
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top:20, left:20),
            child: Row(
            children: [
              Text(
                "Favorites",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
            ],
          ),
         ),
         Expanded(
          child: ListView.builder(
            itemCount: finalList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(
                    finalList[index].name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      finalList[index].description,
                      overflow: TextOverflow.ellipsis,
                    ),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(finalList[index].image),
                      backgroundColor: Colors.red.shade100,
                    ),
                    trailing: Text(
                      '\$${finalList[index].price}',
                      style:const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      tileColor: Colors.white,
                  ),
                );
              }, 
            ),
          ),
        ],
      ),
    );
  }
}
