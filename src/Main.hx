import convert.holiday.Video;
import eval.luv.SockAddr.SocketType;
import AST.SortedObj;
import logger.Logger;
import const.Config;
import haxe.io.Path;
import sys.io.Process;

using StringTools;

class Main {
	var fileArr:Array<String> = [];
	var dirArr:Array<String> = [];
	var ignoreArr:Array<String> = ['.gitkeep', '.buildignore', '.gitignore', '.DS_Store',];

	var startTime:Date;
	var endTime:Date;

	var sortedArr:SortedObj = {};

	public function new(?args:Array<String>) {
		// Sys.command('clear'); // will produce a `TERM environment variable not set.`
		info('Start project: "${Project.NAME}", version: ${Config.VERSION}');
		// check time
		startTime = Date.now();

		initArgs(args);
		initFolders();
		checkAngular();

		if (Config.PATH == '')
			return;

		info('Use file or folder, collect files/folders');
		// initLog();
		// init();
		// setupProject();
		if (!sys.FileSystem.isDirectory(Config.PATH)) {
			// only one file, assume its good and push
			fileArr.push(Config.PATH);
		} else {
			// it's a folder!
			recursiveLoop(Config.PATH);
		}

		mute('dirArr.length: ${dirArr.length}', 1);
		mute('fileArr.length: ${fileArr.length}', 1);
		mute('ignoreArr: $ignoreArr', 1);

		info('OUTPUT DATA');
		outputFiles();

		info('OUTPUT SPECIFIC DATA');
		new convert.holiday.Video(fileArr);

		info('GET STATS');
		// do something clever
		statsFiles();

		// check time again
		endTime = Date.now();

		info('End project');
		warn('Time to complete conversion: ${((endTime.getTime() - startTime.getTime()) / 1000)} sec');
	}

	function checkAngular() {
		info('[WIP] Check for angular.json in the root of the folder');
	}

	function outputFiles() {
		info('Output Files');

		var md = '# files:\n';
		for (i in 0...fileArr.length) {
			var file = fileArr[i];
			md += '${file}\n';
		}

		SaveFile.writeFile(Folder.EXPORT, 'files.md', md);
	}

	function statsFiles() {
		info('Stats Files');
		sortedArr = {
			components_ts: [],
			components_html: [],
			components_scss: [],
			components_spec: [],
			services_ts: [],
			services_spec: [],
			typescript: [],
			html: [],
		};
		for (i in 0...fileArr.length) {
			var file = fileArr[i];
			// Components
			if (file.indexOf('.component.ts') != -1) {
				// mute('Stats Component TypeScript: `${file.split('/src')[1]}`', 1);
				sortedArr.components_ts.push(file);
			}
			if (file.indexOf('.component.html') != -1) {
				// mute('Stats Component HTML: `${file.split('/src')[1]}`', 1);
				sortedArr.components_html.push(file);
			}
			if (file.indexOf('.component.scss') != -1) {
				// mute('Stats Component scss: `${file.split('/src')[1]}`', 1);
				sortedArr.components_scss.push(file);
			}
			if (file.indexOf('.component.spec.ts') != -1) {
				// mute('Stats Component Test TypeScript: `${file.split('/src')[1]}`', 1);
				sortedArr.components_spec.push(file);
			}
			// Services
			if (file.indexOf('.service.ts') != -1) {
				// mute('Stats Service TypeScript: `${file.split('/src')[1]}`', 1);
				sortedArr.services_ts.push(file);
			}
			if (file.indexOf('.service.spec.ts') != -1) {
				// mute('Stats Service Test TypeScript: `${file.split('/src')[1]}`', 1);
				sortedArr.services_spec.push(file);
			}
			// TypeScript and HTML
			if (file.indexOf('.ts') != -1) {
				// mute('Stats Typescript: `${file.split('/src')[1]}`', 1);
				sortedArr.typescript.push(file);
			}
			if (file.indexOf('.html') != -1) {
				// mute('Stats HTML: `${file.split('/src')[1]}`', 1);
				sortedArr.html.push(file);
			}
		}
		info('sortedArr.components_ts.length: ${sortedArr.components_ts.length}', 1);
		info('sortedArr.components_html.length: ${sortedArr.components_html.length}', 1);
		info('sortedArr.components_spec.length: ${sortedArr.components_spec.length}', 1);
		info('sortedArr.components_scss.length: ${sortedArr.components_scss.length}', 1);
		info('sortedArr.typescript.length: ${sortedArr.typescript.length}', 1);
		info('sortedArr.html.length: ${sortedArr.html.length}', 1);
	}

	function initArgs(?args:Array<String>) {
		var args:Array<String> = args;
		info('SETTINGS');

		if (args.length == 0)
			args.push('-h');

		for (i in 0...args.length) {
			var temp = args[i];
			switch (temp) {
				case '-v', '--version':
					Sys.println('Version: ' + Config.VERSION);
				// case '-cd', '--folder': // isFolderSet = true;
				case '-f', '--force':
					mute('Config.IS_OVERWRITE = true', 1);
					Config.IS_OVERWRITE = true;
				case '-d', '--dryrun':
					mute('Config.IS_DRYRUN = true', 1);
					Config.IS_DRYRUN = true;
				case '-b', '--basic':
					mute('Config.IS_BASIC = true', 1);
					Config.IS_BASIC = true;
				case '--debug':
					mute('Config.IS_DEBUG = true', 1);
					Config.IS_DEBUG = true;
				case '--help', '-h':
					showHelp();
				case '--out', '-o':
					// log(args[i + 1]);
					var str = '# README\n\n**Generated on:** ${Date.now()}\n**Target:**';
					SaveFile.writeFile(Sys.getCwd(), 'TESTME.MD', str);
				case '--in', '-i':
					mute('Config.PATH: "${args[i + 1]}"', 1);
					Config.PATH = args[i + 1];
				default:
					// trace("case '" + temp + "': trace ('" + temp + "');");
			}
		}
	}

	function initFolders() {
		Folder.ROOT_FOLDER = Sys.getCwd();
		Folder.BIN = Path.join([Sys.getCwd(), 'bin']);
		Folder.DIST = Path.join([Sys.getCwd(), 'dist']);
		Folder.ASSETS = Path.join([Sys.getCwd(), 'assets']);
		Folder.EXPORT = Path.join([Sys.getCwd(), 'export']);
		info('Folder.ROOT_FOLDER: ${Folder.ROOT_FOLDER}', 1);
		info(Folder.BIN, 1);
		info(Folder.DIST, 1);
		info('Folder.ASSETS: ${Folder.ASSETS}', 1);
		info('Folder.EXPORT: ${Folder.EXPORT}', 1);
	}

	/**
	 * [Description]
	 * @param directory
	 */
	function recursiveLoop(directory:String = "path/to/") {
		if (sys.FileSystem.exists(directory)) {
			// log("Directory found: " + directory);
			for (file in sys.FileSystem.readDirectory(directory)) {
				var path = haxe.io.Path.join([directory, file]);
				if (!sys.FileSystem.isDirectory(path)) {
					// file
					// log("File found: " + path);
					var fileName = Path.withoutDirectory(path);
					// log(ignoreArr.contains(fileName));

					if (!ignoreArr.contains(fileName)) {
						// log(fileName);
						fileArr.push(path);
					} else {
						// log(fileName);
					}

					// log(Path.withoutDirectory(path));
					// ignoreArr.push(Path.withoutDirectory(path));
				} else {
					// folder
					dirArr.push(path);
					var directory = haxe.io.Path.addTrailingSlash(path);
					recursiveLoop(directory);
				}
			}
		} else {
			warn('${Emoji.x} "$directory" does not exists');
		}
	}

	/**
	 * test custom loggin
	 */
	function initLog() {
		Sys.println('this is the default sys.println');
		// logging via Haxe
		log("this is a log message");
		warn("this is a warn message");
		info("this is a info message");
		progress("this is a progress message");
	}

	function showHelp():Void {
		Sys.println('
----------------------------------------------------
Lia-angular-stats (${Config.VERSION})

  --version / -v	: version number
  --help / -h		: show this help
  --in / -i 		: path to project folder
  --out / -o		: write readme (WIP)
  --force / -f		: force overwrite
  --dryrun / -d		: run without writing files
  --basic / -b		: test without content
  --debug			: write test with some extra debug information
----------------------------------------------------
');

	}

	static public function main() {
		var app = new Main(Sys.args());
	}
}
