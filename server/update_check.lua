
local url = "https://raw.githubusercontent.com/TGRHavoc/live_map/master/version.json"
local version = "2.1.7"
local latest = true

local rawData = LoadResourceFile(GetCurrentResourceName(), "version.json")

if not rawData then
    print("Couldn't read \"versions.json\" file.. Please make sure it's readable and exists.")
else
    rawData = json.decode(rawData)
    version = rawData["resource"]
end



function checkForUpdate()
    PerformHttpRequest(url, function(err, data, headers)
        local parsed = json.decode(data)

        if (parsed["resource"] ~= version) then
            print("|===================================================|")
            print("|             Live Map Update Available             |")
            print("|    Current : " .. version .. "                                |")
            print("|    Latest  : " .. parsed["resource"] .. "                                |")
            print("| Download at: https://github.com/TGRHavoc/live_map |")
            print("|===================================================|")
            latest = false -- Stop running the timeout
        end

        if (latest) then -- If it's the latest then check for updates every 30 mins
            SetTimeout( 30 * (60*1000), checkForUpdate)
        end

    end, "GET", "",  { ["Content-Type"] = 'application/json' })

end

checkForUpdate();
