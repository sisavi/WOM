import 'package:world_of_mouth/providers/destination_provider.dart';
import 'package:world_of_mouth/providers/user.dart';

import 'models/feed_item.dart';

List<User> DUMMY_USERS = [
  User(
      id: "u1",
      fullName: "Gordon Ramsey",
      password: "Parool123",
      email: "gordon@gmail.com",
      expertise: "Master Chef",
      description: "I'm a cool person",
      avatarUrl:
          "https://yt3.ggpht.com/ytc/AAUvwnhSeGCbeHJD09S7X-Qo8yuQKJqYdHa85OqkBDzSmg=s900-c-k-c0x00ffffff-no-rj",
      following: ["u3"]),
  User(
      id: "u2",
      fullName: "Joel Ostrat",
      password: "Joel123",
      email: "joel@gmail.com",
      expertise: "Estonian Chef",
      description: "I'm Estonian Chef",
      avatarUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIeOIMByEpmZWjd-aGxb05WrMicmhhnoMXAA&usqp=CAU",
      following: ["u1"]),
  User(
      id: "u3",
      fullName: "Madis Maalt",
      password: "madis123",
      email: "madis@gmail.com",
      expertise: "Food Expert",
      description: "I'm like to eat",
      avatarUrl:
          "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8cG9ydHJhaXR8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
      following: ["u2", "u1"]),
  User(
      id: "u4",
      fullName: "Jamie Oliver",
      password: "Parool123",
      email: "gordon@gmail.com",
      expertise: "TV Chef",
      description: "I'm a cool person",
      avatarUrl:
          "https://www.chatelaine.com/wp-content/uploads/2014/12/Jamie-Oliver-at-Chatelaine.jpg",
      following: ["u3"]),
  User(
      id: "u5",
      fullName: "Marco Pierre",
      password: "Parool123",
      email: "gordon@gmail.com",
      expertise: "Professional Chef",
      description: "I'm a cool person",
      avatarUrl:
          "https://images.newindianexpress.com/uploads/user/imagelibrary/2020/2/22/w900X450/The_Monk_in_the.jpg",
      following: ["u3"]),
];

List<FeedItem> FEED_ITEMS = [
  FeedItem(
    id: "i1",
    userId: "u1",
    imageUrl:
        "https://images.pexels.com/photos/1437267/pexels-photo-1437267.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    title: "Pasta",
    locaton: "Tallinn",
  ),
  FeedItem(
      userId: "u2",
      imageUrl:
          "https://hips.hearstapps.com/hmg-prod/images/classic-buffalo-wings-horizontal-279-1547506077.jpg",
      title: "Chicken Wings",
      locaton: "London",
      id: "i2"),
  FeedItem(
      userId: "u1",
      imageUrl:
          "https://food-images.files.bbci.co.uk/food/recipes/spicybeefburger_71357_16x9.jpg",
      title: "Beef Burger",
      locaton: "Texas, America",
      id: "i3"),
  FeedItem(
      userId: "u1",
      imageUrl:
          "https://static.toiimg.com/thumb/53784736.cms?width=1200&height=900",
      title: "Tortilla",
      locaton: "Tallinn",
      id: "i4"),
  FeedItem(
      userId: "u3",
      imageUrl:
          "https://static.toiimg.com/thumb/53784736.cms?width=1200&height=900",
      title: "Pizza",
      locaton: "Berlin",
      id: "i5"),
];

List<Destination> DESTINATIONS = [
  Destination(
      city: "Paris",
      restaurantsCount: 300,
      pictureUrl:
          "https://media.timeout.com/images/105387012/630/472/image.jpg"),
  Destination(
      city: "Tallinn",
      restaurantsCount: 100,
      pictureUrl:
          "https://www.visittallinn.ee/static/files/098/tn3_restoran_2.jpg"),
  Destination(
      city: "Riga",
      restaurantsCount: 10,
      pictureUrl:
          "https://media-cdn.tripadvisor.com/media/photo-s/0f/83/d7/09/dome.jpg")
];
