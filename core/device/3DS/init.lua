local OS = love.system.getOS()

if OS[2] == "3DS" and OS[2] ~= "Switch" then
    return
end

local _PACKAGE = (...)

require(_PACKAGE .. ".video.graphics")
require(_PACKAGE .. ".hid.input")