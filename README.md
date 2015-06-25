# sib-test
Unit test and assertion framework for Sibelius ManuScript development

As part of my cunning plan to drag Sibelius plugin development kicking and
screaming into the 21st Century, here's a unit test and assertions framework
implemented as a plugin. Take a look at TestTest.plg for an example of its
use (it's the set of unit tests for the assertions code).

## Usage

In your Run function, the following:
```javascript
  suite = Test.Suite('Name of test suite', Self, ThePluginToTest);

  suite
    .Add('TestSomething')   // the name of a test function
    .Add('TestSomethingElse')
    ;

  suite.Run(suite);
```

## Test Functions
Test functions are passed an assert object, which supports methods for testing a variety
of conditions, and the plugin under test (passed to the constructor for the test suite
in your Run function). Test functions look like this:

```javascript
TestSomething(assert, plugin)

   result = plugin.DoSomething(1,2,3);
   assert.Equal(result, 99, "Correct result from DoSomething");

```

The assert methods return true/false depending on whether the assertion passes or not. In addition
the object remembers assertion failures (which it reports back to the test suite) and on failure
writes to the trace window (which will be opened by the test plugin if it isn't already open, so you
might want to open it manually and resize it).

## Assert
Currently supports the following:

```javascript
  testAssert.Equal(10, 10, 'output if the two arguments are *not* equal');
  testAssert.NotEqual(10, 10, 'output if the two arguments *are* equal');
  testAssert.OK(True, 'this is output if the actual value is not True');
  testAssert.NotOK(False, 'and this if the actual value is not False');
```


## Building sib-test
You really should take a look at [plgToMSS](https://github.com/tido/plgToMSS). The src and test
directories in this repo are set up for this tool.





