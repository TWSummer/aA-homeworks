// window.setTimeout(() => alert('HAMMERTIME'), 5000);
//
// function hammertime(time) {
//   return () => {
//     window.setTimeout(() => alert(`${time} is HAMMERTIME!`), 3500);
//   }
// }

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits() {
  reader.question('Would you like some tea?', (res1) => {
    console.log(`You replied ${res1}.`);
    reader.question('Would you like some biscuits?', (res2) => {
        console.log(`You replied ${res2}`);
        const first = (res1 === 'yes') ? 'do' : 'don\'t'
        const second = (res2 === 'yes') ? 'do' : 'don\'t'
        console.log(`So you ${first} want tea and you ${second} want biscuits.`);
        reader.close();
    });
  });
}

teaAndBiscuits();
