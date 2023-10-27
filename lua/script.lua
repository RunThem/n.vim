#!/usr/bin/env lua

local fmt = string.format

local msg = ''

for i = 0, 10 do
  msg = msg .. fmt('%d, ', i)
end

print(msg)
