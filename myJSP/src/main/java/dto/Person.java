package dto;

public class Person {

	private String name; // 이름
	private int age; // 나이
	
	
	public Person(){
		
	
	}
	

	public Person(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}

	
	// set, get ----------------------------------
	
		
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

	
	
}
