package utils;

class Copyright {
	static public function init(type:String) {
		var year = Date.now().getFullYear();
		var message = 'Copyright 2014-${year} Smart Society Services B.V.';
		if (type == 'js' || type == 'ts') {
			return '/*\n${message}\n*/';
		} else {
			return '<!--\n${message}\n-->';
		}
	}
}
