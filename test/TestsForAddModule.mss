function TestsForAddModule(suite) {
  //$module(TestsForAddModule.mss)

  gAddModuleTest1Run = False;
  gAddModuleTest2Run = False;

  suite
    .Add('TestsForAddModule1')
    .Add('TestsForAddModule2')
    .Add('CheckTestsHaveRun')
    ;
} //$end

function TestsForAddModule1(assert, plugin) {
  //$module(TestsForAddModule.mss)
  gAddModuleTest1Run = True;
} //$end

function TestsForAddModule2(assert, plugin) {
  //$module(TestsForAddModule.mss)
  gAddModuleTest2Run = True;
} //$end

function CheckTestsHaveRun(assert, plugin) {
  //$module(TestsForAddModule.mss)
  assert.OK(gAddModuleTest1Run,'AddModuleTest1 has run');
  assert.OK(gAddModuleTest2Run,'AddModuleTest2 has run');
} //$end
