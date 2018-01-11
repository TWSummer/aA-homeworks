function madlib(verb, adjective, noun) {
  return `We shall ${verb} the ${adjective} ${noun}`;
}

function isSubstring(searchString, substring) {
  return searchString.split(substring).length > 1;
}

function fizzBuzz(array) {
  let result = [];
  for (let i = 0; i < array.length; i++) {
    if ((array[i] % 3 === 0 || array[i] % 5 === 0) && !(array[i] % 3 === 0 && array[i] % 5 === 0)) {
      result.push(array[i]);
    }
  }
  return result;
}

function isPrime(num) {
  for (let i = 2; i < num; i++) {
    if (num % i === 0) {
      return false;
    }
  }
  return true;
}

function firstNPrimes(n) {
  result = [];
  let i = 2;
  while (result.length < n) {
    if (isPrime(i)) {
      result.push(i);
    }
    i += 1
  }
  return result;
}

function sumOfNPrimes(n) {
  let sum = 0;
  let primes = firstNPrimes(n);
  for (let i=0; i<primes.length; i++) {
    sum += primes[i];
  }
  return sum;
}


console.log(madlib("make", "best", "guacamole"));
console.log(isSubstring("The cat in the hat", "cat"));
console.log(fizzBuzz([1,2,3,4,15,16,17,18,19,20, 21, 25]));
console.log(isPrime(17));
console.log(isPrime(33));
console.log(firstNPrimes(7));
console.log(sumOfNPrimes(4));
