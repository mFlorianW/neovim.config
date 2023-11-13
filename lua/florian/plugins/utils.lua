local Utils = {}

local function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end


function Utils.cmake_build_dir()
    local status, cmake = pcall(require, "cmake-tools")
    if status then
        -- print(cmake.get_build_directory())
        return cmake.get_build_directory()
    end
    return string.format("%s/build", vim.fn.getcwd())
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
