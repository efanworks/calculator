/**
 * Recursive function to flatten arrays and sum all numbers
 * @param item - A number or an array of numbers (potentially nested)
 * @returns The sum of all numbers
 */
function flattenAndSum(item: number | any[]): number {
  if (Array.isArray(item)) {
    return item.reduce((sum: number, val) => sum + flattenAndSum(val), 0);
  }
  return typeof item === 'number' ? item : 0;
}

/**
 * Calculates the sum of numbers or arrays of numbers (including nested arrays)
 * @param args - Numbers or arrays of numbers to sum
 * @returns The total sum
 */
export function sum(...args: (number | any[])[]): number {
  return args.reduce((total: number, current) => {
    return total + flattenAndSum(current);
  }, 0);
}

// Default export for easier importing
export default {
  sum
};
