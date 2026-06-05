local pickers      = require "telescope.pickers"
local finders      = require "telescope.finders"
local make_entry   = require "telescope.make_entry"
local conf         = require("telescope.config").values
local actions      = require "telescope.actions"
local action_state = require "telescope.actions.state"

local M = {}

M.live_multireplace = function(opts)
  opts = opts or {}
  opts.cwd = opts.cwd or vim.uv.cwd()

  local finder = finders.new_async_job {
    command_generator = function(prompt)
      if not prompt or prompt == "" then return end

      local pieces = vim.split(prompt, "  ")
      local args = { "rg" }

      if pieces[1] and pieces[1] ~= "" then
        table.insert(args, "-e")
        table.insert(args, pieces[1])
      end

      -- pieces[2] = replace (ignored by rg, used on confirm)
      -- pieces[3] = glob
      if pieces[3] and pieces[3] ~= "" then
        table.insert(args, "-g")
        table.insert(args, pieces[3])
      end

      ---@diagnostic disable-next-line: deprecated
      return vim.tbl_flatten {
        args,
        { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" }
      }
    end,
    entry_maker = make_entry.gen_from_vimgrep(opts),
    cwd = opts.cwd,
  }

  pickers.new(opts, {
    debounce = 100,
    prompt_title = "Multi Grep Replace  [search  replace  glob]",
    finder = finder,
    previewer = conf.grep_previewer(opts),
    sorter = require("telescope.sorters").empty(),

    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        local picker = action_state.get_current_picker(prompt_bufnr)
        local prompt = picker:_get_prompt()
        local pieces = vim.split(prompt, "  ")

        local search  = pieces[1]
        local replace = pieces[2]

        if not search or search == "" or not replace or replace == "" then
          vim.notify("Needs: search  replace  [glob]", vim.log.levels.WARN)
          return
        end

        -- collect unique filenames from all results
        local seen  = {}
        local files = {}
        for entry in picker.manager:iter() do
          if entry and entry.filename and not seen[entry.filename] then
            seen[entry.filename] = true
            table.insert(files, entry.filename)
          end
        end

        actions.close(prompt_bufnr)

        local replaced = 0
        local failed   = {}

        for _, file in ipairs(files) do
          vim.cmd("edit " .. vim.fn.fnameescape(file))
          local ok, err = pcall(
            vim.cmd,
            string.format(
              "%%s/%s/%s/g",
              vim.fn.escape(search, "/\\"),
              vim.fn.escape(replace, "/\\")
            )
          )
          if ok then
            vim.cmd("update")
            replaced = replaced + 1
          else
            table.insert(failed, file)
          end
        end

        vim.notify(
          string.format("Replaced in %d/%d files", replaced, #files),
          replaced == #files and vim.log.levels.INFO or vim.log.levels.WARN
        )

        if #failed > 0 then
          vim.notify("Failed:\n" .. table.concat(failed, "\n"), vim.log.levels.ERROR)
        end
      end)

      return true
    end,
  }):find()
end

return M
