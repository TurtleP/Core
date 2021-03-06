local util = {}

function util.round(num, idp) --Not by me
    local mult = 10^(idp or 0)
    return math.floor(num * mult + 0.5) / mult
end

function string:split(delimiter) --Not by me
    local result = {}
    local from   = 1
    local delim_from, delim_to = string.find( self, delimiter, from   )
    while delim_from do
        table.insert( result, string.sub( self, from , delim_from-1 ) )
        from = delim_to + 1
        delim_from, delim_to = string.find( self, delimiter, from   )
    end
    table.insert( result, string.sub( self, from   ) )
    return result
end

return util