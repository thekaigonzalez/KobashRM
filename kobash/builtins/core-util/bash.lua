local f = {}

function f:main()
    local cb = readline("session$ ") or nil
    local cba = OneTimeSplit(cb)

    if io.open("./kobash-mac/bin") == nil then
        print("ENOENT: please run `make deps' from your terminal.")
    else
        local custom_dir = string.gsub(cba[0], "~", "./kobash-mac", 1)
        if cb == nil or cba == nil then
            print("stdin: I/O read error")
        else
            if io.open("./kobash-mac/bin/" .. cba[0]) ~= nil then
                local fchunk = loadfile("./kobash-mac/bin/" .. cba[0]) or nil
                if fchunk == nil then
                    print(cba[0] .. ": permission denied")
                else
                    fchunk = fchunk() or nil
                    if fchunk == nil then
                        print("unit: test 2 failed. did you return a table with functions?")
                    else
                        pcall(function () fchunk:main(cba) end)
                    end
                end
            elseif io.open("./kobash-mac/bin/" .. cba[0] .. ".lua") ~= nil then
                local fchunk = loadfile("./kobash-mac/bin/" .. cba[0] .. ".lua") or nil
                if fchunk == nil then
                    print(cba[0] .. ": Permission denied")
                else
                    fchunk = fchunk()
                    pcall(fchunk:main(cba))
                end
                pcall(function () fchunk:main(cba) end)
            elseif io.open(cba[0]) ~= nil then
                local fchunk = loadfile(cba[0]) or nil
                if fchunk == nil then
                    print(cba[0] .. ": is a directory")
                else
                    pcall(function () fchunk:main(cba) end)
                end
            elseif io.open(custom_dir) ~= nil then
                local fchunk = loadfile(custom_dir) or nil
                if fchunk == nil then
                    print(custom_dir .. ": is a directory")
                else
                    pcall(function() fchunk:main(cba) end)
                end
            else
                print(custom_dir .. ": command not found")
            end
        end
    end
end


return f