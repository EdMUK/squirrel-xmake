add_rules("mode.debug", "mode.release")

-- Define the source files for sqstdlib
local sqstdlib_src = {
    "sqstdaux.cpp",
    "sqstdblob.cpp",
    "sqstdio.cpp",
    "sqstdmath.cpp",
    "sqstdrex.cpp",
    "sqstdstream.cpp",
    "sqstdstring.cpp",
    "sqstdsystem.cpp"
}

-- Shared library target for sqstdlib
if not has_config("DISABLE_DYNAMIC") then
    target("sqstdlib")
        set_kind("shared")
        add_files(sqstdlib_src)
        add_deps("squirrel")
        set_targetdir("$(buildir)/$(plat)/$(arch)/$(mode)")
        add_includedirs("$(projectdir)/include", {public = true})
        if has_config("LONG_OUTPUT_NAMES") then
            set_basename("sqstdlib3")
        else
            set_basename("sqstdlib")
        end

        -- Installation (adjust as needed)
        -- after_build(function (target)
        --     os.cp(target:targetfile(), "/path/to/install/")
        -- end)
end

-- Static library target for sqstdlib
if not has_config("DISABLE_STATIC") then
    target("sqstdlib_static")
        set_kind("static")
        add_files(sqstdlib_src)
        add_deps("squirrel_static")
        set_targetdir("$(buildir)/$(plat)/$(arch)/$(mode)")
        add_includedirs("$(projectdir)/include", {public = true})
        if has_config("LONG_OUTPUT_NAMES") then
            set_basename("sqstdlib3_static")
        else
            set_basename("sqstdlib_static")
        end

        -- Installation (adjust as needed)
        -- after_build(function (target)
        --     os.cp(target:targetfile(), "/path/to/install/")
        -- end)
end
