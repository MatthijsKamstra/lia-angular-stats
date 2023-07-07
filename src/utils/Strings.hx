package utils;

class Strings {
	/**
	 * convert to upper camel case
	 *
	 * 	- `foo.bar` = `FooBar`
	 * 	- `foo-bar` = `FooBar`
	 * 	- `foo_bar` = `FooBar`
	 * 	- `foo bar` = `FooBar`
	 *
	 * @param val
	 * @return String
	 */
	static public function toUpperCamel(val:String):String {
		val = val.trim().replace('.', ' ').replace('-', ' ').replace('_', ' ');
		var out = '';
		var arr = val.split(' ');
		for (word in arr) {
			out += word.charAt(0).toUpperCase() + word.substr(1);
		}
		return out;
	}

	/**
	 * convert to lower camel case
	 *
	 * 	- `foo.bar` = `fooBar`
	 * 	- `foo-bar` = `fooBar`
	 * 	- `foo_bar` = `fooBar`
	 * 	- `foo bar` = `fooBar`
	 *
	 * @param val
	 * @return String
	 */
	static public function toLowerCamel(val:String):String {
		var out = toUpperCamel(val);
		return out.charAt(0).toLowerCase() + out.substr(1);
	}
}
