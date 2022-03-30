pragma solidity >=0.4.22 <0.9.0;

library SafeMath {
  function add(uint256 num1, uint256 num2) internal pure returns(uint256) {
    uint256 sum = num1 + num2;
    require(sum >= num1, 'SafeMath: Addition Overflow Error');

    return sum;
  }

  function subtract(uint256 num1, uint256 num2) internal pure returns(uint256) {
    uint256 difference = num1 - num2;
    require(difference <= num1, 'SafeMath: Subtraction Overflow Error');

    return difference;
  }
}