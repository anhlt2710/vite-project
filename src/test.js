import { assert } from 'chai';

// Function that checks whether a number is even or not
function isEven(number) {
  return number % 2 === 0;
}

// Test cases
describe('Check for even numbers', function () {
  it('Even numbers return true', function () {
    assert.isTrue(isEven(4));
  });

  it('Odd number returns false', function () {
    assert.isFalse(isEven(3));
  });

  it('0 is an even number', function () {
    assert.isTrue(isEven(0));
  });

  it('Negative numbers can also be even numbers', function () {
    assert.isTrue(isEven(-2));
  });
});
