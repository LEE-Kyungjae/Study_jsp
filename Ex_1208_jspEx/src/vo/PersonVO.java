package vo;

public class PersonVO {
	//VO(Value Object) : DB에서 가져온 정보를 row단위로 저장하기 위한 클래스
	private String name;
	private int age;
	private String tel;
							
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
}
