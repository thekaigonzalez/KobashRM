local lugo = {}

function lugo:main(v)
    print("using lugo 1.0.0")
    print("lugo-build-x86_64")
    print("type 'help' for a list of command descriptions.")
    print("type 'uname' to view build information.")
    while true do
        local uinput = readline("lugo-admin ~$ ")
        local cargv = OneTimeSplit(uinput)
        print("")
    end

end

return lugo