set_languages("c99")

-- Dynamic executable target
if not has_config("DISABLE_DYNAMIC") then
    target("sq")
        set_kind("binary")
        add_files("sq.c")
        add_deps("squirrel", "sqstdlib")
        set_targetdir("$(buildir)/$(plat)/$(arch)/$(mode)")
        add_includedirs("$(projectdir)/include", {public = true})
        if has_config("LONG_OUTPUT_NAMES") then
            set_basename("squirrel3")
        else
            set_basename("sq")
        end

        -- Installation (adjust as needed)
        -- after_build(function (target)
        --     os.cp(target:targetfile(), "/path/to/install/")
        -- end)
end

-- Static executable target
if not has_config("DISABLE_STATIC") then
    target("sq_static")
        set_kind("binary")
        add_files("sq.c")
        add_deps("squirrel_static", "sqstdlib_static")
        set_targetdir("$(buildir)/$(plat)/$(arch)/$(mode)")
        add_includedirs("$(projectdir)/include", {public = true})
        if has_config("LONG_OUTPUT_NAMES") then
            set_basename("squirrel3_static")
        else
            set_basename("sq_static")
        end

        -- Installation (adjust as needed)
        -- after_build(function (target)
        --     os.cp(target:targetfile(), "/path/to/install/")
        -- end)
end
