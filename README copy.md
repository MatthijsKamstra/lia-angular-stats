# lia-angular-test

POC write Angular tests (wip)

Probably good to know

- Angular 15.2.4
- files generate with Angular CLI (aka `ng g service foobar`)
- VSCODE [prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode) and [formatting](https://marketplace.visualstudio.com/items?itemName=tombonnike.vscode-status-bar-format-toggle) is active on save

## POC

assumptions everywhere, thats why it is a Proof-of-concept

- tabs (not spaces)
- formatting (see above)
- vars above the constructor (probably always a good idea, but ...)
- ...

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
Lia-angular-test (0.0.1)

  --version / -v        : version number
  --help / -h           : show this help
  --in / -i             : path to project folder
  --out / -o            : write readme (WIP)
  --force / -f          : force overwrite
  --dryrun / -d         : run without writing files
----------------------------------------------------
```
