
import 'package:Huddle/models/nearMe.dart';
import 'package:Huddle/server/auth.dart';
import 'package:graphql/client.dart';

List<NearMe> nearMe = [];

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
  locationUser(location:"jal"){
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
    
  }
  return true;
}
