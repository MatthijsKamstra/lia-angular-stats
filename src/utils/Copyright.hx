package utils;

class Copyright {
	/**
	 * quick and dirty check if copyright is present
	 * @return String
	 */
	static public function checkForValue():String {
		return 'Copyright ';
	}

	/**
	 * value the copyright should be
	 * @return String
	 */
	static public function shouldBe():String {
		var year = Date.now().getFullYear();
		// var message = 'Copyright 2014-${year} Smart Society Services B.V.';
		var message = 'Copyright ${year} Alliander N.V.';
		return message;
	}

	static public function init(type:String) {
		var message = Copyright.shouldBe();
		if (type == 'js' || type == 'ts') {
			return '/*\n${message}\n*/';
		} else {
			return '<!--\n${message}\n-->';
		}
	}
}
