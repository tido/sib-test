function Assert() {
  //$module(Assert.mss)
  assert = CreateDictionary('failed', False);
  assert.SetMethod('OK', Self, '_OK');
  assert.SetMethod('NotOK', Self, '_notOK');
  assert.SetMethod('Equal', Self, '_equal');
  assert.SetMethod('NotEqual', Self, '_notEqual');

  assert.SetMethod('_fail1', Self, '_fail1');
  assert.SetMethod('_fail2', Self, '_fail2');
  assert.SetMethod('_fail',  Self, '_fail');

  return assert;
} //$end

function _OK(this, value, message) {
  //$module(Assert.mss)
  if (value) {
  	return True;
  }

  return this._fail1('OK', value, message);
} //$end

function _notOK(this, value, message) {
  //$module(Assert.mss)
  if (value) {
    return this._fail1('NotOK', value, message);
  }

  return True;
} //$end

function _equal(this, actual, expected, message) {
  //$module(Assert.mss)
  if (actual = expected) {
  	return True;
  }

  return this._fail2('Equal', actual, expected, message);
} //$end

function _notEqual(this, actual, expected, message) {
  //$module(Assert.mss)
  if (actual != expected) {
    return True;
  }

  return this._fail2('NotEqual', actual, expected, message);
} //$end

function _fail(this, message) {
  //$module(Assert.mss)
  trace('FAIL: ' & message);
  this.failed = True;
  return False;
} //$end

function _fail1(this, call, value, message) {
  //$module(Assert.mss)
  return this._fail(call & ' ' & value & ' (' & message & ')');
} //$end

function _fail2(this, call, value1, value2, message) {
  //$module(Assert.mss)
  return this._fail(call & ' ' & value1 & ', ' & value2 & ' (' & message & ')');
} //$end
﻿
