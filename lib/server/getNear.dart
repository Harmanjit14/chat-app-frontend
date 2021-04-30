import 'package:Huddle/models/nearMe.dart';
import 'package:Huddle/server/auth.dart';
import 'package:Huddle/server/getLocation.dart';
import 'package:graphql/client.dart';

List<NearMe> nearMe = [];

Future<bool> getNearMe() async {
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
  locationUser(location:"${currentLoc.dist}"){
    id
    name
    image
    gender
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
  var nearMeData = data.data["getChatIds"];
  for (var item in nearMeData) {
    NearMe obj = new NearMe();
    obj.id = item["id"];
    obj.name = item["name"];
    obj.isFemal = (item["gender"] == 'F') ? true : false;
    obj.image = item["image"];
    nearMe.add(obj);
  }
  return true;
}
