package convert.alliander;

import utils.Copyright;

class CopyrightAdd {
	public function new(fileArr:Array<String>) {
		trace('CopyrightAdd');
	}

	//  function init(){
	// 	// test with
	// 	// setCopyright('/Users/matthijskamstra/Documents/workingdir/Alliander/web-net-management-2/src/app/pages/devices-o-without-organisation/devices-o-without-organisation.component.ts', true);
	// 	// `component.ts`
	// 	for (i in 0...sortedArr.components_ts.length) {
	// 		var path = sortedArr.components_ts[i];
	// 		// trace(path);
	// 		var originalContent = sys.io.File.getContent(path);
	// 		if (originalContent.indexOf('Copyright 2014') == -1) {
	// 			// warn(path + ' doesn\'t have a copyright');
	// 			missingSortedArr.components_ts.push(path);
	// 			setCopyright(path, true);
	// 		}
	// 	}
	// 	warn('Components.ts without Copyright: ' + missingSortedArr.components_ts.length);
	// 	warn('Components.ts with Copyright: ' + (sortedArr.components_ts.length - missingSortedArr.components_ts.length));
	// 	// setCopyright('/Users/matthijskamstra/Documents/workingdir/Alliander/web-net-management-2/src/app/pages/devices-o-without-organisation/devices-o-without-organisation.component.html',	true);
	// 	// `component.html`
	// 	for (i in 0...sortedArr.components_html.length) {
	// 		var path = sortedArr.components_html[i];
	// 		// trace(path);
	// 		var originalContent = sys.io.File.getContent(path);
	// 		if (originalContent.indexOf('Copyright 2014') == -1) {
	// 			// warn(path + ' doesn\'t have a copyright');
	// 			missingSortedArr.components_html.push(path);
	// 			setCopyright(path, true);
	// 		}
	// 	}
	// 	warn('Components.html without Copyright: ' + missingSortedArr.components_html.length);
	// 	warn('Components.html with Copyright: ' + (sortedArr.components_html.length - missingSortedArr.components_html.length));
	// }
	function setCopyright(path:String, overwrite:Bool = false) {
		var arr = path.split('.');
		var ext = arr[arr.length - 1];
		var originalContent = sys.io.File.getContent(path);
		var str = Copyright.init(ext) + '\n\n' + originalContent;
		if (overwrite) {
			sys.io.File.saveContent(path, str);
		} else {
			warn(path + ' doesn\'t have a copyright');
		}
	}
}
