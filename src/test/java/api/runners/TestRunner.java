package api.runners;

import com.intuit.karate.junit5.Karate;

public class TestRunner {

	@Karate.Test
	public Karate runTest() {
		// run()  method required path to feature file.
		// you can use ags() ethod to specify the Tags.
		return Karate.run("classpath:features")
				.tags("Regression");
	}
	
	
}
