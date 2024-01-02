package hash2;

import java.util.HashSet;
import java.util.Set;
//폰켓몬
class Solution {
    public int solution(int[] nums) {
        int answer = 0;
        int n=nums.length/2;
        Set<Integer> set = new HashSet<Integer>();
        for (int key : nums) set.add(key);
        
        if(n < set.size()) {
        	return n;
        }	        	
       return set.size();
    }
}
