local M = {}

function M.telescope(builtin, opts)
    local params = { builtin = builtin, opts=opts }
    return function()
        builtin = params.builtin
        opts = params.opts

end
