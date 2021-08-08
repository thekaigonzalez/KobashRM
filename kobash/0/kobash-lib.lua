package.cpath = package.cpath .. ";lib/?.so"

require 'readline'
function tprint (tbl, indent)
    if not indent then indent = 0 end
    for k, v in pairs(tbl) do
        formatting = string.rep("  ", indent) .. k .. ": "
        if type(v) == "table" then
            print(formatting)
            tprint(v, indent+1)
        elseif type(v) == 'boolean' then
            print(formatting .. tostring(v))
        else
            print(formatting .. v)
        end
    end
end
function split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end
function chunkify (s)
    return "return " .. s
end
function dostring(s)
    return assert(load(s))()
end
function OneTimeSplit(string)
    local tblt = {}
    local lns = split(string, " ")
    i = 0
    -- works!

    for _,V in ipairs(lns) do
        tblt[i] = V;
        i = i + 1
    end
    return tblt
end
function ReadLine(f, line)
    local i = 1 -- line counter
    for l in f:lines() do -- lines iterator, "l" returns the line
        if i == line then return l end -- we found this line, return it
        i = i + 1 -- counting lines
    end
    return "" -- Doesn't have that line
end

local k = {}

function k:main(ENTRY)
    if ENTRY == 0x0ab13 then
        print("login successful on 0")
        while true do
            if io.open("./kobash-mac/etc") == nil then
                print("W: please run through a full install to install terminal-superuser. (setup-commands)")
            else
                if io.open("./kobash-mac/etc/terminals") ~= nil then
                    local tfile = io.open("./kobash-mac/etc/terminals", "r")
                    local terminal_to_run = ReadLine(tfile, 1)
                    if terminal_to_run == "default" or terminal_to_run == nil then
                        loadfile("./kobash-mac/bin/bash")():main()
                    else
                        function string.starts(String,Start)
                            return string.sub(String,1,string.len(Start))==Start
                        end

                        if terminal_to_run:starts("/") then
                            local abc = string.gsub(terminal_to_run, "/", "./kobash-mac/", 1)
                            loadfile(abc)():main()
                        end
                    end
                end
            end
        end
    end
end

return k