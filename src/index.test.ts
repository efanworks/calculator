import { sum } from './index';

describe('sum function', () => {
  it('should sum multiple numbers correctly', () => {
    expect(sum(1, 2, 3, 4)).toBe(10);
  });

  it('should handle a single number', () => {
    expect(sum(5)).toBe(5);
  });

  it('should sum arrays correctly', () => {
    expect(sum([1, 2, 3])).toBe(6);
  });

  it('should sum mixed numbers and arrays', () => {
    expect(sum(1, [2, 3], 4)).toBe(10);
  });

  it('should handle nested arrays', () => {
    expect(sum([1, [2, 3]], 4)).toBe(10);
  });

  it('should handle empty arrays', () => {
    expect(sum([])).toBe(0);
  });

  it('should handle no arguments', () => {
    expect(sum()).toBe(0);
  });
});
