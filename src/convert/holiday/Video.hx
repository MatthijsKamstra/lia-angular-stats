package convert.holiday;

class Video {
	public function new(fileArr:Array<String>) {
		// trace('Video');
		var HOLIDAY = Folder.EXPORT + '/holiday';
		var videoExtension = ['mkv', 'mov', 'mp4'];

		var videoArr = [];

		var md = '# Files:\n\n';
		var md2 = '# Not Files:\n\n';
		var sh = '#!/bin/sh\n\necho "Start converting videos"\nsay "Start converting videos"\n\n';
		var sh2 = '#!/bin/sh\n\necho "Start converting videos"\nsay "Start converting videos"\n\n';

		for (i in 0...fileArr.length) {
			var file = fileArr[i].trim();
			var isVideo = '';
			var isNotVideo = file;
			for (j in 0...videoExtension.length) {
				var _videoExtension = videoExtension[j];
				// trace(_videoExtension);
				if (file.indexOf(_videoExtension) != -1) {
					isVideo = file;
					isNotVideo = '';
					break;
				}
			}
			if (isVideo != '') {
				md += '- ${isVideo}\n';
				sh += '${convertData(isVideo)}\n';
				videoArr.push(isVideo);
			}

			if (isNotVideo != '') {
				md2 += '- ${isNotVideo}\n';
			}
		}

		warn('total nr of videos: ${videoArr.length}');
		for (i in 0...videoArr.length) {
			var file = videoArr[i];
			sh2 += '${convertData(file)}\n';
		}

		sh += '\n\necho "End converting videos"\nsay "End converting videos"\n\n';
		sh2 += '\n\necho "End converting videos"\nsay "End converting videos"\n\n';

		// SaveFile.writeFile(HOLIDAY, 'holiday_2023.sh', sh);
		SaveFile.writeFile(HOLIDAY, 'holiday_2023_2.sh', sh2);
		SaveFile.writeFile(HOLIDAY, 'files.md', md);
		SaveFile.writeFile(HOLIDAY, 'files_not.md', md2);
	}

	// ffmpeg -i ~/Movies/input4/Alvin.And.The.Chipmunks.2007.720p.BluRay.x264.[YTS.AG].mp4 -vf "scale=(iw*sar)*max(720/(iw*sar)\,405/ih):ih*max(720/(iw*sar)\,405/ih), crop=720:405" -c:v mpeg4 -q:v 7 -c:a libmp3lame -q:a 4 ~/Movies/output4/Alvin_And_The_Chipmunks.mp4
	function convertData(videoPath:String):String {
		var fileNameArr = videoPath.split('/');
		var fileName = convertFileName(fileNameArr[fileNameArr.length - 1]);
		var out = '';
		out += '\n# ${fileName}\n';
		out += 'say "${fileName.replace('_', ' ')}"\n';

		out += 'ffmpeg -i ${convertPathEscaped(videoPath)} -vf "scale=(iw*sar)*max(720/(iw*sar)\\,405/ih):ih*max(720/(iw*sar)\\,405/ih), crop=720:405" -c:v mpeg4 -q:v 7 -c:a libmp3lame -q:a 4 ~/Movies/output_2023/${fileName}.mp4';
		return out;
	}

	function convertPathEscaped(videoPath:String):String {
		var out = '';
		var _backTickHack = '\\';
		videoPath = videoPath.replace(' ', '${_backTickHack} ');
		videoPath = videoPath.replace('(', '\\(');
		videoPath = videoPath.replace(')', '\\)');
		videoPath = videoPath.replace('[', '\\[');
		videoPath = videoPath.replace(']', '\\]');
		out = videoPath;
		return out;
	}

	function convertFileName(fileName:String):String {
		fileName = fileName.replace('.', '_').replace(' ', '_').replace('!', '');
		fileName = fileName.split('_720p')[0];
		fileName = fileName.split('_2023')[0];
		fileName = fileName.split('_2022')[0];
		fileName = fileName.split('_2021')[0];
		fileName = fileName.split('_2020')[0];
		fileName = fileName.split('_2019')[0];
		fileName = fileName.split('_2018')[0];
		fileName = fileName.split('_2017')[0];
		fileName = fileName.split('_2016')[0];
		fileName = fileName.split('_2015')[0];
		fileName = fileName.split('_2014')[0];
		fileName = fileName.split('_2013')[0];
		fileName = fileName.split('_2012')[0];
		fileName = fileName.split('_2011')[0];
		fileName = fileName.split('_2010')[0];
		fileName = fileName.split('_2009')[0];
		fileName = fileName.split('_2008')[0];
		fileName = fileName.split('_2007')[0];
		fileName = fileName.split('_2006')[0];
		fileName = fileName.split('_2005')[0];
		fileName = fileName.split('_2004')[0];
		fileName = fileName.split('_2003')[0];
		fileName = fileName.split('_2002')[0];
		fileName = fileName.split('_2001')[0];
		fileName = fileName.split('_1991')[0];
		fileName = fileName.split('_Doragon')[0];
		return fileName;
	}
}
