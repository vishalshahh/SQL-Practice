/*
REAL WORLD:
Price calculation without modifying original data
*/

// Pure function
function calculateDiscount(price) {
    return price * 0.9;
}

console.log(calculateDiscount(1000));

// Impure function
let total = 0;

function addToTotal(price) {
    total += price;
}

addToTotal(100);
console.log(total);