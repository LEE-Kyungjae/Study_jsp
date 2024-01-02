package hash3_2;

import java.util.Arrays;

class Solution {
	public boolean solution(String[] phoneBook) {
		Arrays.sort(phoneBook);
		for (int i = 0; i < phoneBook.length - 1; i++) {
			for (int j = i + 1; j < phoneBook.length; j++) {
				if (phoneBook[j].indexOf((phoneBook[i])) > 0)
					return false;
			}
		}
		return true;
	}
}
