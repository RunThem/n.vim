#!/usr/bin/env lua

local fmt = string.format
local function printf(format, ...)
  print(fmt(format, ...))
end

local msg = ''
local N = 1000

-- typeof(_Generic(typeof(u),
--            typeof(__u_vec_t(*)(ssize_t, bool)): (bool){},
--            typeof(__u_vec_t(*)(ssize_t, int)): (int){}))

for i = 0, N do
  msg = msg .. fmt('typedef struct {} st_%d;\n', i)
end

print(msg)

msg = ''
for i = 0, N do
  msg = msg .. fmt('typeof(__u_vec_t(*)(ssize_t, st_%d)): (st_%d){}', i, i)
  if i ~= N then
    msg = msg .. ', '
  end
end

printf('#define u_vec_defs  %s', msg)
