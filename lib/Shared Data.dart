import 'dart:math';

class SharedData {
  SharedData_() {}
  static const List<Map<String, String>> RECOMENDATIONS = <Map<String, String>>[
    {
      'title': 'people meeting',
      'image': '3.png',
      'subtitle': 'Some people have a meeting'
    },
    {'title': 'New Pants', 'image': '2.png', 'subtitle': 'The Pants to wear'},
    {
      'title': 'People Writing',
      'image': '1.png',
      'subtitle': 'Novels in creation !!'
    },{
      'title': 'people meeting',
      'image': '3.png',
      'subtitle': 'Some people have a meeting'
    },
    {'title': 'New Pants', 'image': '2.png', 'subtitle': 'The Pants to wear'},
    {
      'title': 'People Writing',
      'image': '1.png',
      'subtitle': 'Novels in creation !!'
    },{
      'title': 'people meeting',
      'image': '3.png',
      'subtitle': 'Some people have a meeting'
    },
    {'title': 'New Pants', 'image': '2.png', 'subtitle': 'The Pants to wear'},
    {
      'title': 'People Writing',
      'image': '1.png',
      'subtitle': 'Novels in creation !!'
    }
  ];
  static final List<Map<String, String>> PREVIEWDATA = <Map<String, String>>[
    {
      'title': 'People Meeting',
      'image': '3.png',
      'length': '${Random().nextInt(45)}:${Random().nextInt(60)}',
      'size': '${Random().nextInt(7) + 5}',
      'subtitle':
          'The Netflix staff in action making some novels\n,poetry,T.V shows , Movies some good ideas for\ncivilizationfor the next generations'
    },
    {
      'title': 'New Pants',
      'image': '2.png',
      'length': '${Random().nextInt(45)}:${Random().nextInt(60)}',
      'size': '${Random().nextInt(7) + 5}',
      'subtitle': 'This is the new fashion!!\nThe new drop from G&G for the fall is now available\nat almost every store so hurry up and buy some !'
    },
    {
      'title': 'People Writing',
      'image': '1.png',
      'length': '${Random().nextInt(45)}:${Random().nextInt(60)}',
      'size': '${Random().nextInt(7) + 5}',
      'subtitle': 'Some people have a meeting and making some novels ,\npoetry and some good ideas for civilization \nfor the next generations'
    }
  ];
}
