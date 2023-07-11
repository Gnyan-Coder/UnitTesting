import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:unittesting/User/user_controller.dart';
import 'package:unittesting/User/user_model.dart';

class MockHTTPClient extends Mock implements Client {}

void main() {
  late UserRepository userRepository;
  late MockHTTPClient mockHTTPClient;

  setUp(() {
    mockHTTPClient = MockHTTPClient();
    userRepository = UserRepository(mockHTTPClient);
  });

  group("UserRepository -", () {
    group("getUser function", () {
      test("given user Repository classs status code 200 ", () async {
        // arrange
        when(() => mockHTTPClient
                .get(Uri.parse("https://reqres.in/api/users?page=2")))
            .thenAnswer((invocation) async {
          return Response("""
                            {
                            "page": 2,
                            "per_page": 6,
                            "total": 12,
                            "total_pages": 2,
                            "data": [
                            {
                            "id": 7,
                            "email": "michael.lawson@reqres.in",
                            "first_name": "Michael",
                            "last_name": "Lawson",
                            "avatar": "https://reqres.in/img/faces/7-image.jpg"
                            }
                            ],
                            "support": {
                            "url": "https://reqres.in/#support-heading",
                            "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
                            }
                            }""", 
                            200);
              });
              // act
              final user = await userRepository.getUser();
              // assert
              expect(user, isA<UserModel>());
            });

      test("getUser function status cod eis not 200", () async {
        // arrange
        when(()=>mockHTTPClient.get(Uri.parse("https://reqres.in/api/users?page=2"))
        ).thenAnswer((invocation)async{
          return Response('{}'
            ,500
            );
        });
        // act
        final user =userRepository.getUser();
        // assert
        expect(user, throwsException);
      });
    });
  });
}
