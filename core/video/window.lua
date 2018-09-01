local window = {}

--Default width and height
window.width  = love.graphics.getWidth()
window.height = love.graphics.getHeight()
window.modes  = love.window.getFullscreenModes()

function window:initialize()
    self.scalar = vector(1, 1)
    self.size = vector(self.width, self.height)

    return self
end

function window:calculateFullscreen()
    local mathScale = math.max
    local modes = self.modes

    local target = vector(modes[1].width, modes[1].height)

    local function scaleTo(to, from)
        return util.round(mathScale(to / from))
    end

    self.scalar = vector(scaleTo(target.x, self.width), scaleTo(target.y, self.height))
end

function window:setFullscreen(enable)
    assert(type(enable) == "boolean", 
           "Invalid type for argument #1 for `window:setFullscreen`. 
           Boolean expected, got " .. type(enable))
    
    local flags = {} 
    if enable then
        self:calculateFullscreen()
    
        flags.fullscreen = true
        flags.fullscreentype = "desktop"
    end

    local width = self.size.x * self.scalar.x
    local height = self.size.y * self.scalar.y

    if width > self.modes[1].width then
        width = self.size.x * (self.scalar.x - 1)
    end

    if height > self.modes[1].height then
        height = self.size.y * (self.scalar.y - 1)
    end

    self:setSize(width, height, flags)
end

function window:setScale(scalarX, scalarY)
    assert(scalarX == nil or type(scalarX) == "number", 
           "Invalid type for argument #1 for `window:setScale`. 
           Number expected, got " .. type(scalarX))

    assert(scalarY == nil or type(scalarY) == "number", 
           "Invalid type for argument #2 for `window:setScale`. 
           Number expected, got " .. type(scalarX))

    local scalar = self.scalar
    self.scalar = vector(scalarX or scalar.x, scalarY or scalar.y)

    local width = self.size.x * self.scalar.x
    local height = self.size.y * self.scalar.y

    if width > self.modes[1].width or height > self.modes[1].height then
        self:setFullscreen(true)
    end

    self:setSize(width, height, flags)
end

function window:setSize(width, height, flags)
    self.size = vector(width, height)

    love.window.updateMode(width, height, flags)
end

function window:getScale()
    return self.scalar
end

function window:getWidth()
    return self.width
end

function window:getHeight()
    return self.height
end

return window:initialize()