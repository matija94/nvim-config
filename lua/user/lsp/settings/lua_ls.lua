local groupFileStatus = {
    --[[ /* ]]
    --[[ * ambiguity-1 ]]
    --[[ * count-down-loop ]]
    --[[ * different-requires ]]
    --[[ * newfield-call ]]
    --[[ * newline-call ]]
    --[[ */ ]]
    ambiguity = "Opened",
    --[[ /* ]]
    --[[ * await-in-sync ]]
    --[[ * not-yieldable ]]
    --[[ */ ]]
    await = "Opened",
    --[[ /* ]]
    --[[ * codestyle-check ]]
    --[[ * spell-check ]]
    --[[ */ ]]
    codestyle = "Opened",
    --[[ /* ]]
    --[[ * duplicate-index ]]
    --[[ * duplicate-set-field ]]
    --[[ */ ]]
    duplicate = "Opened",
    --[[ /* ]]
    --[[ * global-in-nil-env ]]
    --[[ * lowercase-global ]]
    --[[ * undefined-env-child ]]
    --[[ * undefined-global ]]
    --[[ */ ]]
    global = "Opened",
    --[[ /* ]]
    --[[ * cast-type-mismatch ]]
    --[[ * circle-doc-class ]]
    --[[ * doc-field-no-class ]]
    --[[ * duplicate-doc-alias ]]
    --[[ * duplicate-doc-field ]]
    --[[ * duplicate-doc-param ]]
    --[[ * undefined-doc-class ]]
    --[[ * undefined-doc-name ]]
    --[[ * undefined-doc-param ]]
    --[[ * unknown-cast-variable ]]
    --[[ * unknown-diag-code ]]
    --[[ * unknown-operator ]]
    --[[ */ ]]
    luadoc = "Opened",
    --[[ /* ]]
    --[[ * redefined-local ]]
    --[[ */ ]]
    redefined = "Opened",
    --[[ /* ]]
    --[[ * close-non-object ]]
    --[[ * deprecated ]]
    --[[ * discard-returns ]]
    --[[ */ ]]
    strict = "Opened",
    --[[ /* ]]
    --[[ * no-unknown ]]
    --[[ */ ]]
    strong= "Opened",
    --[[ /* ]]
    --[[ * assign-type-mismatch ]]
    --[[ * cast-local-type ]]
    --[[ * cast-type-mismatch ]]
    --[[ * need-check-nil ]]
    --[[ * param-type-mismatch ]]
    --[[ * return-type-mismatch ]]
    --[[ * undefined-field ]]
    --[[ */ ]]
    ["type-check"] = "Opened",
    --[[ /* ]]
    --[[ * missing-parameter ]]
    --[[ * missing-return ]]
    --[[ * missing-return-value ]]
    --[[ * redundant-parameter ]]
    --[[ * redundant-return-value ]]
    --[[ * redundant-value ]]
    --[[ * unbalanced-assignments ]]
    --[[ */ ]]
    unbalanced = "Opened",
    --[[ /* ]]
    --[[ * code-after-break ]]
    --[[ * empty-block ]]
    --[[ * redundant-return ]]
    --[[ * trailing-space ]]
    --[[ * unreachable-code ]]
    --[[ * unused-function ]]
    --[[ * unused-label ]]
    --[[ * unused-local ]]
    --[[ * unused-vararg ]]
    --[[ */ ]]
    unused = "Opened",
}
return {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        enable = true,
        globals = { 'vim' },
        groupFileStatus = groupFileStatus,
        workspaceEvent = "None",
      },
      --[[ workspace = { ]]
      --[[   -- Make the server aware of Neovim runtime files ]]
      --[[   library = vim.api.nvim_get_runtime_file("", true), ]]
      --[[ }, ]]
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
