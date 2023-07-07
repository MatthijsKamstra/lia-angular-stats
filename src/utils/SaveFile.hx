package utils;

import haxe.io.Path;

using StringTools;

class SaveFile {
	/**
	 *
	 *
	 * @param path
	 * @param str
	 */
	static public function out(path:String, str:String) {
		// write the file
		sys.io.File.saveContent(path, str);
	}

	/**
	 * simply write the files
	 *
	 * @param path 		folder to write the files
	 * @param filename	(with extension) the file name
	 * @param content	what to write to the file (in our case markdown)
	 */
	static public function writeFile(path:String, filename:String, content:String) {
		if (!sys.FileSystem.exists(path)) {
			sys.FileSystem.createDirectory(path);
		}
		// write the file
		sys.io.File.saveContent(path + '/${filename}', content);
		trace('written file: ${path}/${filename}');
	}
}
