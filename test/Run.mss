function Run() {
  //$module(Run.mss)
	suite = Test.Suite('ASSERT tests', Self, Test);

	suite
  	.Add('TestEqual')
  	.Add('TestNotEqual')
    .Add('TestOK')
    .Add('TestNotOK')

    ;

	trace('Expect to see FAILs here, they\'re testing expected failures!');
	suite.Run(suite);
}  //$end
