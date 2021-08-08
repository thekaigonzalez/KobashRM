local gh = {}

function gh:main(a)
    if a[1] == nil then
        print("hi.")
    else
        print("hi, " .. a[1] .. ".")
    end
end

return gh