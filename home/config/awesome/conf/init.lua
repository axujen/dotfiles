local conf = {}
package.loaded["conf"] = conf -- https://stackoverflow.com/q/8248698

-- {{{ Modules
conf.vars     = require('conf.vars')
conf.helpers  = require('conf.helpers')
-- }}}

return conf
