local schemas = require("schemastore").yaml.schemas()

return {
  settings = {
    yaml = {
      schemaStore = { enable = false, url = "" },
      schemas = schemas,
      validate = true,
      format = { enable = true },
    },
  },
}
