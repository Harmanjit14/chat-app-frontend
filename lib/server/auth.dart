import "package:graphql/client.dart";

String token = "";

Future<bool> login(String username, String password) async{
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

  String mutationString = """
  mutation{
  tokenAuth(username:"$username",password:"$password"){
    token
   
  }
}""";


  MutationOptions options = MutationOptions(
    document: gql(mutationString),
  );

  QueryResult data= await client.mutate(options);
  if(data.hasException){
    print(data.exception.toString());
    return false;
  }
  token = data.data["tokenAuth"]["token"];
  return true;

}

Future<bool> register(String username, String email,String password) async{
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

  String mutationString = """
  mutation{
  createUser(username:"test1",password:"123456",email:"test@abc.com"){
    __typename
  }
}
}""";


  MutationOptions options = MutationOptions(
    document: gql(mutationString),
  );

  QueryResult data= await client.mutate(options);
  if(data.hasException){
    print(data.exception.toString());
    return false;
  }
  return true;

}
