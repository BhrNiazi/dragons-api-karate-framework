package api.data;

public class GenerateData {

	
	public static String getEmail() {
		String email = "Bahara";
		String provider = "@tekschool.us";
		int randomNumber = (int) (Math.random()* 10000);
		String autoEmail = email + randomNumber  + provider;
		return autoEmail;
		}
	
	public static void main(String [] args) {
		System.out.println(getEmail());
	}
}
