require "libsyscalls"
local lugo_install = {}

function lugo_install:install()
    print("lugo-install: copying lugo.lua into HOME if it doesn't exist")
    if io.open("./kobash-mac/bin/lugo") == nil then
        sysfcpy("kobash/builtins/LuGo/lugo.lua", "kobash-mac/bin/lugo")
        print("lugo-install: triggers processed")
        print("lugo-install: Completed!")
    else
        print("lugo-install: lugo installation found in HOME, upgrading it ...")
        os.remove("kobash-mac/bin/lugo")
        sysfcpy("kobash/builtins/LuGo/lugo.lua", "kobash-mac/bin/lugo")
        print("lugo-install: processing triggers ...")
        print("lugo-install completed!")
    end
end
return lugo_install