package const;

class Config {
	/**
	 * 0.0.1 - initial code
	 * 0.0.2 - setup code reading, overwrite, etc
	 * 0.0.3 - POC services
	 * 0.0.4 - services update
	 * 0.0.5 - service typedef update, POST and GET, multiple functions, data in test needed
	 * 0.0.6 - test based upon return types (bool, string, etc)
	 * 0.0.7 - fix bug from bigger classes
	 * 0.0.8 - remove time from generation, getter setter tests, default var values added
	 * 0.0.9 - add extra constructor values as variables and TestBed
	 * 0.1.0 - fix bug in getter tests to add params
	 * 0.1.1 - add basic tests, add Agular test project
	 * 0.1.2 - refactor return types and params
	 * 0.1.3 - fix bug providers
	 * 0.1.4 - AAA-testing boolean/etc
	 * 0.1.5 - adding debug, generating values for testing
	 * 0.1.6 - adding fake translations service if needed
	 * 0.1.7 - START components
	 * 0.1.8 - vars generated components
	 * 0.1.9 - cleaning up, class vars
	 * 0.2.0 - testing services better
	 * 0.2.1 - void better test
	 * 0.2.2 - FormControle / FormGroup exclude by comment, added SPEC_CONST, better type values
	 * 0.2.3 - subscribe service tests
	 * 0.2.4 - fix missing imports, values, setup
	 * 0.2.5 - rewrite services
	 * 0.2.6 - adding more if/else statements, adding starting point test
	 * 0.2.7 - update components with info from services
	 * 0.2.8 - start converting html templates data to test
	 * 0.2.9 - add environment data to test if needed
	 * 0.3.0 - check for html default test
	 */
	public static final VERSION:String = '0.3.0';

	public static var PATH = ''; // file or folder
	public static var IS_OVERWRITE = false;
	public static var IS_DRYRUN = false;
	public static var IS_BASIC = false;
	public static var IS_DEBUG = false;
}
