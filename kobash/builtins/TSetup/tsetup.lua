--- sysfcpy(file/dir1, to) - Copys directory 1 to 2.

require 'libsyscalls'

local k = {}

function k:main(a)

    print("setup initialization")
    print("1: express install")
    print("2: simple install")
    print("3: full install (LuGo, TSetup, Sudok, Operion, SDKs, org)")
    print("4: SDK install")
    print("5: install a custom plugin")
    print("6: create an install script")
    local choose = io.read("n")

    if choose == nil then
        print("I/O read error")
    elseif choose == 1 then
        print("installing sudok-core & crout-lib ...")
        if io.open("./kobash-mac/bin/sudok") == nil then
            sysfcpy("kobash/builtins/Sudok/sudok-core.lua", "kobash-mac/bin/sudok")
        else
            print("sudok-install: Already installed, upgrading it...")
            os.remove("kobash-mac/bin/sudok")
            sysfcpy("kobash/builtins/Sudok/sudok-core.lua", "kobash-mac/bin/sudok")
        end
        print("copying sudok-core to CONTAINER_HOME")
        print("done!")
        print("installing crout-lib...")
        if io.open("./kobash-mac/bin/crout") == nil then
            sysfcpy("kobash/builtins/crout/crout-pkg.lua", "kobash-mac/bin/crout")
        else
            print("crout-install: Already installed, upgrading it...")
            os.remove("kobash-mac/bin/crout")
            sysfcpy("kobash/builtins/crout/crout-pkg.lua", "kobash-mac/bin/crout")
        end
        print("processing triggers for sudok-core ...")
        print("processing triggers for crout-pkg ...")
        print("express install completed.")
    elseif choose == 2 then
        print("installing sudok-core ...")
        if io.open("./kobash-mac/bin/sudok") == nil then
            sysfcpy("kobash/builtins/Sudok/sudok-core.lua", "kobash-mac/bin/sudok")
        else
            print("sudok-install: Already installed, upgrading it...")
            os.remove("kobash-mac/bin/sudok")
            sysfcpy("kobash/builtins/Sudok/sudok-core.lua", "kobash-mac/bin/sudok")
        end
    elseif choose == 3 then
        print("a FULL install will happen.")
        print("After this, around ~10.7Mb will be taken.")
        print("are you sure you want to continue?")
        local yn = readline("[Y/n] ")
        if yn == 'n' then
            print("open: prompt is false")
        elseif yn == 'y' then
            print("installing sudok-core & crout-lib ...")
            if io.open("./kobash-mac/bin/sudok") == nil then
                sysfcpy("kobash/builtins/Sudok/sudok-core.lua", "kobash-mac/bin/sudok")
            else
                print("sudok-install: Already installed, upgrading it...")
                os.remove("kobash-mac/bin/sudok")
                sysfcpy("kobash/builtins/Sudok/sudok-core.lua", "kobash-mac/bin/sudok")
            end
            print("copying sudok-core to CONTAINER_HOME")
            print("done!")
            print("installing crout-lib...")
            if io.open("./kobash-mac/bin/crout") == nil then
                sysfcpy("kobash/builtins/crout/crout-pkg.lua", "kobash-mac/bin/crout")
            else
                print("crout-install: Already installed, upgrading it...")
                os.remove("kobash-mac/bin/crout")
                sysfcpy("kobash/builtins/crout/crout-pkg.lua", "kobash-mac/bin/crout")
            end
            print("installing lugo using lugo-install from LUGO_PKG")
            local lugo_install = loadfile("./kobash/builtins/LuGo/lugo-install.lua") or nil
            if lugo_install == nil then
                print("installation failed! lugo installation trigger not found")
            else
                if lugo_install == nil then
                    print("unit: test 2 failed.")
                else
                    lugo_install():install()
                end
            end
            print("installing terminal-superuser")
            if io.open("./kobash-mac/etc") == nil then
                sys_mkdir("./kobash-mac/etc")
            else
                print("terminal-superuser: /etc exists - don't overwrite")
            end
            local terminals = io.open("./kobash-mac/etc/terminals", "w")
            terminals:write("default")
            terminals:close()
            print("terminal-superuser: successfully installed iterm-lib (/etc/terminals/")
            print("terminal-superuser: installing /etc/tkrun (iterm-init-lib)")
            local tkrun = io.open("./kobash-mac/etc/tkrun", "w")
            tkrun:write("")
            tkrun:close()
            print("terminal-superuser: successfully installed Terminal-Runtime (/etc/tkrun)")
            print("terminal-superuser: successfully installed terminal-superuser")
        else
            print("open: wrong input!")
        end
    elseif choose == 4 then
        print("SDK: which type of SDK would you like to install?")
        print("1: Builtin")
        print("2: custom")
        local ns = tonumber(readline("number: "))
        if ns == 1 then
            print("install sdk: choose an sdk")
            print("Operion: Source Access (1)")
            print("LuGo: Custom SubAPI (2)")
            print("Other (3)")
            local snf = tonumber(readline("number: "))
            if snf == 1 then
                print("Installing operion-lib")
                print("oper-install: copying OPERION_LIB to HOME (./kobash-mac)")
                -- sysfcpy(d1, d2);
                sysfcpy("./kobash/builtins/operion/include", "");
            end
        end
    end
end

return k