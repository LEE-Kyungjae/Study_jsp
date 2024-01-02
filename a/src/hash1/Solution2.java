package hash1;

import java.util.HashMap;
import java.util.Map;

public class Solution2 {
	 public String solution(String[] participant, String[] completion) {
		 String answer="";
		 Map<String, Integer> map = new HashMap<>();
		 for (String key : participant) map.put(key, map.getOrDefault(key, 0) + 1);
		 //part를 전부 집어넣고 전체다 1을 대입함
		 for (String key : completion)	map.put(key, map.get(key)-1);
		 //comp를 전부 집어넣고 만약
		 for (String key : map.keySet()) {
			if(map.get(key)!=0) {
				answer=key;
			}
		}
		 return answer;
	 }
}