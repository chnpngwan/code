// 136.给你一个 非空 整数数组 nums ，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。

// 你必须设计并实现线性时间复杂度的算法来解决此问题，且该算法只使用常量额外空间。

// 输入：nums = [2,2,1]
// 输出：1

var singleNumber = function(nums) {
  let ans = 0;
  for(const num of nums){
      ans^=num;
  }
  return ans;
};

nums = [2,2,1]

console.log(singleNumber(nums));