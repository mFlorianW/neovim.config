local Utils = {}
local status, cmake = pcall(require, "cmake-tools")

local function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

function Utils.cmake_build_dir()
    if not status then
        return string.format("%s/dummy_folder_that_should_not_match", vim.fn.getcwd())
    end
    if cmake.is_cmake_project() then
        return cmake.get_build_directory()
    else
        return string.format("%s/dummy_folder_that_should_not_match", vim.fn.getcwd())
    end
end

function Utils.qmlls_binary()
    if file_exists("/opt/qt6/bin/qmlls") then
       return "/opt/qt6/bin/qmlls"
    elseif("/usr/bin/qmlls6") then
        return "/usr/bin/qmlls6"
    else
        return "/usr/bin/qmlls"
    end
end

return Utils
