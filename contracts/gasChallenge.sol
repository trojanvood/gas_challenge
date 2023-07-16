// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract gasChallenge {
    //Implement Fixed-Size Array Technique Here
    uint[10] numbers = [1,2,3,4,5,6,7,8,9,10];
    
    //Function to check for sum of array
    //No changes required in this function
    function getSumOfArray() public view returns (uint256) {
        uint sum = 0;
        for (uint i = 0; i < numbers.length; i++) {
            sum += numbers[i];
        }
        return sum;
    }
    
    function notOptimizedFunction() public {
        for (uint i = 0; i < numbers.length; i++) {
            numbers[i] = 0;
        }
    }
    
    //Implement Remaining Gas Optimization Techniques Here
    //Sum of elements in the numbers array should equal 0
    function optimizedFunction() public {
        //Caching State Variable: Storing the array’s length in a variable and use this new variable instead.
        uint[10] memory stateVar = numbers;
        uint length = stateVar.length;

        //Implement Uncheck Block
        unchecked {
            //For Loop Increment Syntax: Pre-increment (++i) is used in the for loop instead of post-increment (i++). 
            for (uint i = 0; i < length; ++i) {
                stateVar[i] = 0;
            }
        }
        numbers = stateVar;
    }
 }