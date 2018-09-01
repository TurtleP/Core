# cöre • a simple API for games

## Usage
```lua
--load cöre and libraries
require "core"
```

The library comes with smaller components and useful libraries. For example, it comes with `video` and `system` submodules. Inside `video` is the `window` API which can handle resizing, scaling, fullscreen for your LÖVE game. `System` comes with a `save` API to save and load settings or other data.

```lua
--resize the window
window:setSize(400, 400)
```

#### To Do
- Enable a way to save existing "default" values
- Enable limit on "files"--right now it's for multi-save games
- Enable use of file name to save options or other data instead

```lua
--save "time" to a file, save.txt
--by default it will only save the date
save:encode({data = {time = 0})
```

There is also a compatability layer for [Löve Potion](https://github.com/TurtleP/LovePotion). All you need to do is:

```lua
--load cöre and libraries
require "core"

function love.load()
    --load the 3DS device mode
    --Switch will just be resolution change + input stuff *NOT YET IMPLEMENTED*
    core.init("3DS")
end
```

## Libraries
The other libraries (for game use) included are:
- [middleclass](https://github.com/kikito/middleclass) by [kikito](https://github.com/kikito)
- [vector](https://github.com/vrld/hump/blob/master/vector.lua) by [vrld](https://github.com/vrld)
- util and physics by myself

For the dependencies of the library:
- [hook](https://github.com/MrVallentin/hook.lua) by [MrVallentin](https://github.com/MrVallentin)
- [json](http://regex.info/blog/lua/json) by [Jeffrey Friedl](http://regex.info/blog)
