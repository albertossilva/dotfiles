local schemas = require("schemastore").json.schemas()

return {
  settings = {
    json = {
      schemas = schemas,
      validate = { enable = true },
      format = { enable = true },
    },
    jsonc = {
      schemas = schemas,
      validate = { enable = true },
      format = { enable = true },
    },
  },
}
