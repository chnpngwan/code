let arr = [1, 2, 3, { value: 4 }];
let arrCopy = arr.concat();

arrCopy.push(4);

console.log(arr); // 输出: [1, 2, 3, { value: 4 }]，原数组未受影响
arrCopy[3].value = 10;

console.log(arr); // 输出: [1, 2, 3, { value: 10 }]，原数组受影响
