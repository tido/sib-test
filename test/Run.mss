function Run() {
  //$module(Run.mss)
	suite = Test.Suite('ASSERT tests', Self, Test);

	suite
  	.Add('TestEqual')
  	.Add('TestNotEqual')
    .Add('TestOK')
    .Add('TestNotOK')
    .AddModule('TestsForAddModule')
    ;

	suite.Run(suite);
  trace('Expect to see FAILs here, they\'re testing expected failures!');
  trace('The FAIL messages are output by the assertion under test, not by the assertions made by the test!');
}  //$end
