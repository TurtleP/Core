local save = {}

local _PACKAGE = (...):match("^(.+)%.[^%.]+")
local json = require(_PACKAGE .. ".json")

function save:initialize()
    self.data = {}

    self.currentSave = 1

    if self:hasData() then
        self:loadData()
    else
        self:generateDefaultData()
    end

    return self
end

function save:hasData()
    return love.filesystem.getInfo("save.txt") ~= nil
end

function save:getData(i)
    return self.data[i]
end

function save:getActiveData()
    return self.data[self.currentSave]
end

function save:get(var)
    if self.data[self.currentSave][var] then
        return self.data[self.currentSave][var]
    end
end

function save:generateDefaultData()
    for i = 1, 3 do
        self.data[i] = {}
    end
    self:writeData("all")
end

function save:encode(i, t) --on save
    if not i then
        i = self.currentSave
    end

    local data = {}

    local date = os.date("%m.%d.%Y")
    data.date = date
    data.time = math.floor(self:getActiveFile().time)

    self:writeData(i, data)
end

function save:writeData(file, data)
    if file ~= "all" then
        if not file then
            file = self.currentSave
        end

        self.data[file] = data

        self.currentSave = file
    end
    
    love.filesystem.write("save.txt", json:encode_pretty(self.data))
end

function save:import(t)

end

function save:loadData()
    local data = love.filesystem.read("save.txt")

    if type(data) == "string" then
        self.data = json:decode(data)
    end
end

return save:initialize()