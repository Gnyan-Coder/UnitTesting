import 'package:flutter_test/flutter_test.dart';
import 'package:unittesting/Counter/counter_controller.dart';

void main() {
  late Counter counter;
  setUp(() {
    counter=Counter();
  });
  group("Counter Class -", () {
    test('given counter class whene it is initialize value of count is 0', () {
      // act
      final val = counter.count;
      // assert
      expect(val, 0);
    });

    test("when counter is incremented  the valu of count should 1", () { 
     // act
      counter.incrementCounter();
      final val = counter.count;
      expect(val, 1);
    });

     test("when counter is decremented  the valu of count should -1", () {
      // act
      counter.decrementCounter();
      final val = counter.count;
      expect(val, -1);
    });

    test("when counter is reset  the valu of count should 0", () {
      // act
      counter.reset();
      final val = counter.count;
      expect(0, 0);
    });
  });

}


// given when then
// pretest
  // setUp(() => null);  // setup is  called before  everytest 
  // setUpAll(() => null); setupAll is called before all the tests

  
   // post test
  // tearDown(() => null); // after every test
  // tearDownAll(() => null); //after all test
  
