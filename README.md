# Lia-Angular-Stats

Some stats of an Angular project

## how it works

convert folders

```bash
haxe build_interp.hxml -i path/to/folder
//
haxe build_interp.hxml -i _testme/one
```

convert files

```bash
haxe build_interp.hxml -i _testme/one/file.service.ts
```

## help

```
----------------------------------------------------
Lia-angular-specs (0.0.1)

  --version / -v        : version number
  --help / -h           : show this help
  --in / -i             : path to project folder
  --out / -o            : write readme (WIP)
  --force / -f          : force overwrite
  --dryrun / -d         : run without writing files
----------------------------------------------------
```
