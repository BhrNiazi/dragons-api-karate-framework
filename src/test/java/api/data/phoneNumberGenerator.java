package api.data;

import java.util.Random;

public class phoneNumberGenerator {

	public static String generatePhoneNumber() {
		Random random = new Random();
		StringBuilder sb = new StringBuilder();
		for (int i=0 ; i<10 ; i++) {
			sb.append(random.nextInt(10));
		}
		return sb.toString();
	}
	
	
	public static void main(String [] args) {
		System.out.println(generatePhoneNumber());
	}
}
