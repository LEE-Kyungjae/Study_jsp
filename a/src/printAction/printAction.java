package printAction;

import java.util.Arrays;
import java.util.List;

public class printAction {
	List<String> list=Arrays.asList("a","b","c","a","f","f");
	
	/* List<Object> list */
	public printAction() {
		List<String>list=null;
		//null처리
		if(list==null) {
			list=this.list;
		}
		
		
		/*
		 * .stream(); 
		 * .filter(); Stream에서 조건에 맞는 데이터만을 정제하여 더 작은 컬렉션을 만드는 데 사용
		 * 				매개 값으로 조건이 주어지며, 참이 되는 요소만을 필터링한다.
		 * .distinct(); Stream 요소들의 중복된 데이터를 제거하기 위해 사용
		 * .map()		메서드는 기존의 Stream 요소들을 대체하는 요소로 구성된 새로운 Stream을 형성하는 연산
		 * 				저장된 값을 특정한 형태로 변환하는 데 주로 사용된다.
		 * .flatMap(); 여러 개의 요소들로 구성된 새로운 스트림을 반환한다.
		 * .forEach();
		 * 
		 */
	}
	
	public static void main(String[] args) {
		List<String> list=Arrays.asList("a","b","c","a","f","f");
		list.forEach(System.out::println);
		System.out.println("--------");
		
		list.stream().distinct().forEach(System.out::println);
		System.out.println("--------");
		
		list.stream().filter(str->str.equals("a"))
		.forEach(System.out::println);
		System.out.println("--------");
		
		list.stream().map(s->s.toUpperCase()).forEach(System.out::println);
		
	}
}

