import 'package:flutter/material.dart';
import 'package:task2/image_model.dart';


class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  int likes = 0;
  List<ImageModel> images = [
    ImageModel('https://cafdn.org/wp-content/uploads/2021/06/Jodene-article-hero-e1655835747755-640x640.webp'),
    ImageModel('https://t3.ftcdn.net/jpg/03/70/29/26/360_F_370292674_QS5nA0bJgyRD6VzYycTQdSWhhSHQJbQZ.jpg'),
    ImageModel('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4LtCrYlmpYUw8cSAmmiC69oRYG1U_qdY_YA&s'),
    ImageModel('https://www.opticalexpress.co.uk/media/1064/man-with-glasses-smiling-looking-into-distance.jpg'),
    ImageModel('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGw-sz_ynsO6fK1gee7Kz13-xZHInABzJrXw&s'),
    ImageModel('https://imgcdn.stablediffusionweb.com/2024/10/29/6f789671-5fda-4caf-87d4-99787a61ef3e.jpg')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Social Dashboard',
          ),
          centerTitle: true,
        ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Profiles',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 350,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 60,
                      childAspectRatio: 2/2
                  ),
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        CircleAvatar(
                          radius: 200,
                          backgroundImage: NetworkImage(images[index].src),
                        ),
                        if(index.isEven)
                          Positioned(
                            bottom: 8,
                            right: 8,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2
                                )
                              ),
                            ),
                          )
                      ]
                    );
                  }
                ),
              ),
              Text(
                'Featured Post',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    Image.network('https://media.istockphoto.com/id/517188688/photo/mountain-landscape.jpg?s=612x612&w=0&k=20&c=A63koPKaCyIwQWOTFBRWXj_PwCrR4cEoOw2S9Q7yVl8='),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        backgroundBlendMode: BlendMode.softLight
                      ),
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'Amazing view!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        )
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Likes: $likes',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      likes++;
                      setState(() {});
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.thumb_up_alt
                        ),
                        Text(
                          'Like',
                          style: TextStyle(
                            fontSize: 18
                          ),
                        )
                      ],
                    )
                  )
                ],
              )
            ],
          ),
        )
      )
    );
  }
}
