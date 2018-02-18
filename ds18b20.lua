_ENV = setmetatable({},{__index=_G})

VERSION = "1.0"
DESCRIPTION = "1-wire temperature sensor reading."
COPYRIGHT = "(c) Herbert Leuwer, 2018"

function version()
   return VERSION
end

function devices()
   local t = {}
   for device in  io.lines("/sys/devices/w1_bus_master1/w1_master_slaves") do
      table.insert(t, device)
   end
   return t
end

function read(device)
   local l
   for s in io.lines("/sys/bus/w1/devices/"..device.."/w1_slave") do
      l = s
   end	
   local temp = string.gsub(l, "(.+t=([%-%w]+))$", "%2")
   return temp/1000
end

function readall()
   local devs = devices()
   local t = {}
   for _, dev in ipairs(devs) do
      local temp = read(dev)
      table.insert(t, {id=dev, temp=temp})
   end
   return t
end

return _ENV
