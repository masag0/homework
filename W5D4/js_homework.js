function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// function mysteryScoping3() { //trying to reassign const
//   const x = 'out of block';
//   if (true) {
//     var x = 'in block';
//     console.log(x);
//   }
//   console.log(x);
// }

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// function mysteryScoping5() { //let declaration twice in one block
//   let x = 'out of block';
//   if (true) {
//     let x = 'in block';
//     console.log(x);
//   }
//   let x = 'out of block again';
//   console.log(x);
// }

function madLib(verb, adj, noun) {
  return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}.`;
}

function isSubstring(searchString, subString) {
  if (searchString.includes(subString)) {
    return true;
  }
  else {
    return false;
  }
}

function fizzBuzz(array) {
  let result = [];
  for (let i = 0; i < array.length; i++) {
    if (array[i]%3 === 0 || array[i]%5 === 0) {
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

function sumOfNPrimes(n) {
  let sum = 0;
  let count = 2;
  let primes = [];
  while (primes.length < n) {
    if (isPrime(count)) {
      primes.push(count);
    }
    count++;
  }
  for (let i = 0; i < primes.length; i++) {
    sum += primes[i];
  }
  return sum;
}

////////////////////////////////////////////////////////////////////////

// function titleize(array, cb) {
//   let titles = [];
//   for (let i = 0; i < array.length; i++) {
//     titles.push(`Mx. ${array[i]} Jingleheimer Schmidt`);
//   }
//   cb(titles);
// }

function titleize(array, cb) {
  let titles = array.map(name => `Mx. ${name} Jingleheimer Schmidt`);
  cb(titles);
}

function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;

}

function getRandomIntInclusive(min, max) {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

Elephant.prototype.trumpet = function() {
  console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`);
};

Elephant.prototype.grow = function() {
  this.height += 12;
};

Elephant.prototype.addTrick = function(trick) {
  this.tricks.push(trick);
};

Elephant.prototype.play = function() {
  let a_trick = this.tricks[getRandomIntInclusive(0,this.tricks.length-1)];
  console.log(`${this.name} is ${a_trick}`);
};

let ele = new Elephant('ele','12',['jump','sit','sleep']);

ele.trumpet();
ele.grow();
ele.addTrick("run");
ele.play();



Elephant.paradeHelper = function (elephant) {
  console.log(`${elephant.name} is trotting by!`);
};

Elephant.paradeHelper(ele);


function dinerBreakfast() {
  let order = "I'd like cheesy scrambled eggs please.";
  console.log(order);

  return function (food) {
    order = `${order.slice(0, order.length - 8)} and ${food} please.`;
    console.log(order);
  };
}

































