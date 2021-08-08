build-dirs:
	mkdir lib
	mkdir kobash-mac
	mkdir kobash-mac/container

man-install: bsudo KobashLib KobashMain Ext deps std.commands libs-build all
	mkdir lib
	mkdir kobash-mac
	mkdir kobash-mac/bin
	mkdir kobash


kobash-container:
	mkdir kobash-mac/bin

sources: all

bsudo:
	luac -o ./kobash-mac/bin/sudok ./kobash/builtins/Sudok/sudok-core.lua

KobashMain:
	luac -o ./kobash-mac/kobashMain.dylib ./kobash/0/kobash-init.lua
KobashLib:
	luac -o ./kobash-mac/kobashLib.dylib ./kobash/0/kobash-lib.lua
Ext:
	luac -o ./kobash-mac/bin/setup-commands ./kobash/builtins/TSetup/tsetup.lua

deps: build-dirs

std.commands:
	luac -o ./kobash-mac/bin/var ./kobash/builtins/standard-commands/var.lua
	luac -o ./kobash-mac/bin/ttm ./kobash/builtins/standard-commands/ttm.lua

libs-build:
	tar -xf libs.tar.gz
all: KobashMain KobashLib Ext std.commands
	luac -o ./kobash-mac/bin/bash ./kobash/builtins/core-util/bash.lua
	gcc kobash/KKobash.c -Wall -llua5.4 -o ./kobash.out
	gcc kobash/luareadline.c -lreadline -shared -Wall -llua5.4 -o ./lib/readline.so
all-sudo: all bsudo