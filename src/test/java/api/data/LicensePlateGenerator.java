package api.data;

import java.util.Random;

public class LicensePlateGenerator {

	public static String generateLicensePlate() {
		Random random = new Random();
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < 3; i++) {
			sb.append((char) (random.nextInt(26) + 'A'));
		}
		for (int i = 0; i < 4; i++) {
			sb.append(random.nextInt(26));
		}

		return sb.toString();
	}

	public static void main(String[] args) {
		System.out.println(generateLicensePlate());
	}
}
