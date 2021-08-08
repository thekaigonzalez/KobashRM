local sudok = {}

function sudok:main(a)
    if #a == 0 then
        print([[
[sudok scrap write] -- Writes a file with user contents.
[sudok init] -- Creates an Init.lua File With Preset Assets and definitions..
[sudok Function.]
[sudok path ext] -- Paths to the "External" Library
[crout update sudok] -- Updates Sudok.
]])
    elseif #a == 1 then
        if a[1] == "scrap" then
            print("SCRAP: sudok command utility")
            print("[scrap write <fname> <ctx>] -- Opens a file buffer containing <ctx>, named <fname>")
            print("[scrap read <fname> <opt-var>] -- Reads a file into <opt-var>. <opt-var> doesn't need to be supplied: if it isn't, then it will default to stdout.")
            print("[scrap print <str> <stream>] -- Adds <str> to <stream>. Invoked using the built-in lua interpreter as a variable.")
        end
    elseif #a == 2 then
        if a[1] == "sd" then

        end
    end
end

return sudok