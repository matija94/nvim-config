require 'pylance'

return {
  settings = {
    python = {
      analysis = {
        --typeCheckingMode = "off",
        completeFunctionParens = true,
        diagnosticMode = "openFilesOnly",
      }
    }
  }
}
