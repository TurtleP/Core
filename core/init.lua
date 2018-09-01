local _PACKAGE = (...)

--load external libraries for Cöre functionality
util   = require(_PACKAGE .. ".libraries.util")
vector = require(_PACKAGE .. ".libraries.vector")
class  = require(_PACKAGE .. ".libraries.middleclass")

save    = require(_PACKAGE .. ".system.save")
window  = require(_PACKAGE .. ".video.window")
physics = require(_PACKAGE .. ".game.physics")