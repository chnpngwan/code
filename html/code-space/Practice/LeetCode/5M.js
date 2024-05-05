// 5.给你一个字符串 s，找到 s 中最长的回文子串。

// 如果字符串的反序与原始字符串相同，则该字符串称为回文字符串。

 

// 示例 1：

// 输入：s = "babad"
// 输出："bab"
// 解释："aba" 同样是符合题意的答案。
// 示例 2：

// 输入：s = "cbbd"
// 输出："bb"
 

// 提示：

// 1 <= s.length <= 1000
// s 仅由数字和英文字母组成

/**
 * @param {string} s
 * @return {string}
 */
var longestPalindrome = function(s) {
  const len = s.length;
  let maxlength = 0;
  let left = 0;
  let right = 0;
  const dp = new Array(len).fill(0).map(()=> new Array(len));
  for(let i = len-1;i>=0;i--){
      for(let j = i;j<len;j++){
          if(s[i] == s[j]){
              if(j-i<= 1){
                  dp[i][j] = true;
              }else if(dp[i+1][j-1]){
                  dp[i][j] = true;
              }
          }
          if(dp[i][j] && j-i+1 >maxlength){
              maxlength = j - i + 1;
              left = i;
              right = j;
          }
      }
  }
  return s.slice(left,right+1);
};

