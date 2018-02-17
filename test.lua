local temp = require "ds18b20"

print(temp.DESCRIPTION)
print(temp.VERSION)
print(temp.COPYRIGHT)

local d = temp.devices()

for _,id in ipairs(d) do
   local temp = temp.read(id)
   print(string.format("sensor %q shows  %.1f °C", id, temp))
end

local t = temp.readall()
for _, v in ipairs(t) do
   print(string.format("%s: %.2f", v.id, v.temp))
end

