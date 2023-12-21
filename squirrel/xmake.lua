add_rules("mode.debug", "mode.release")

-- Define the source files
local squirrel_src = {
    "sqapi.cpp",
    "sqbaselib.cpp",
    "sqclass.cpp",
    "sqcompiler.cpp",
    "sqdebug.cpp",
    "sqfuncstate.cpp",
    "sqlexer.cpp",
    "sqmem.cpp",
    "sqobject.cpp",
    "sqstate.cpp",
    "sqtable.cpp",
    "sqvm.cpp"
}

-- Shared library target
if not has_config("DISABLE_DYNAMIC") then
    target("squirrel")
        set_kind("shared")
        add_files(squirrel_src)
        set_targetdir("$(buildir)/$(plat)/$(arch)/$(mode)")
        add_includedirs("$(projectdir)/include", {public = true})
        if has_config("LONG_OUTPUT_NAMES") then
            set_basename("squirrel3")
        else
            set_basename("squirrel")
        end

        -- Installation (adjust as needed)
        -- after_build(function (target)
        --     os.cp(target:targetfile(), "/path/to/install/")
        -- end)
end

-- Static library target
if not has_config("DISABLE_STATIC") then
    target("squirrel_static")
        set_kind("static")
        add_files(squirrel_src)
        set_targetdir("$(buildir)/$(plat)/$(arch)/$(mode)")
        add_includedirs("$(projectdir)/include", {public = true})
        if has_config("LONG_OUTPUT_NAMES") then
            set_basename("squirrel3_static")
        else
            set_basename("squirrel_static")
        end

        -- Installation (adjust as needed)
        -- after_build(function (target)
        --     os.cp(target:targetfile(), "/path/to/install/")
        -- end)
end
