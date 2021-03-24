import 'package:Huddle/models/chatModel.dart';
import 'package:Huddle/server/auth.dart';
import 'package:graphql/client.dart';

List<ChatData> chats = [];

Future<bool> getChats() async {
  HttpLink _httpLink = HttpLink(
    'https://huddle-backend.herokuapp.com/graphql/',
  );

  AuthLink _authLink = AuthLink(
    getToken: () async => 'JWT $token',
  );

  Link _link = _authLink.concat(_httpLink);
  GraphQLClient client = GraphQLClient(
    /// **NOTE** The default store is the InMemoryStore, which does NOT persist to disk
    cache: GraphQLCache(),
    link: _link,
  );

  String queryString = """
  
{
  getChatIds{
    id
    userA{
      id
      name
      image
      city
      state
      
    }
    userB{
      id
      name
      image
      city
      state
    }
    collection
  }
}
""";

  QueryOptions options = QueryOptions(
    document: gql(queryString),
  );

  QueryResult data = await client.query(options);
  if (data.hasException) {
    print(data.exception.toString());
    return false;
  }
  var chatdata = data.data["getChatIds"];
  for (var item in chatdata) {
    if (item["userA"]["id"] == profile.id.value.toString()) {
      String chatId = item["id"];
      String userId = item["userB"]["id"];
      String userName = item["userB"]["name"];
      String userImage = item["userB"]["image"];
      String userCity = item["userB"]["city"];
      String userState = item["userB"]["state"];
      String collection = item["collection"];
      ChatData obj = new ChatData(
          chatId, userId, userName, userImage, userCity, userState, collection);
      chats.add(obj);
    } else if (item["userB"]["id"] == profile.id.value.toString()) {
      String chatId = item["id"];
      String userId = item["userA"]["id"];
      String userName = item["userA"]["name"];
      String userImage = item["userA"]["image"];
      String userCity = item["userA"]["city"];
      String userState = item["userA"]["state"];
      String collection = item["collection"];
      ChatData obj = new ChatData(
          chatId, userId, userName, userImage, userCity, userState, collection);
      chats.add(obj);
    }
  }
  return true;
}
