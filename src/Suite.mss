function Suite(name, target, plugin) {
	//$module(Suite.mss)
  s = CreateDictionary('name', name, 'target', target, 'plugin', plugin, 'tests', CreateSparseArray());
  s.SetMethod('Add',Self,'_add');
  s.SetMethod('Run',Self,'_run');

  return s;
} //$end

function _add(this, testName) {
  //$module(Suite.mss)
  this.tests.Push(testName);
  return this;
}  //$end

function _run(this) {
  //$module(Suite.mss)
  Sibelius.ShowTraceWindow();

  trace('Running test suite ' & this.name);
  target = this.target;
  plugin = this.plugin;

  failed = 0;
  passed = 0;

  for i = 0 to this.tests.Length {
    assert = Assert();
    testName = this.tests[i];
    result = target.@testName(assert, plugin);
    if (assert.failed) {
      trace('FAIL: ' & testName);
      failed = failed + 1;
    } else {
      trace('OK: ' & testName);
      passed = passed + 1;
    }
  }

  trace('=====================');
  trace((failed + passed) & ' tests, ' & failed & ' failed');
} //$end

