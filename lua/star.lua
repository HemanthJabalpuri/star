#!/usr/bin/env lua5.3
-- parse files made using Motorola singleimage tar utility with magic SINGLE_N_LONELY
-- Tested files of Moto G52(bootloader.img, radio.img, gpt.bin, singleimage.bin)

-- os detect
if package.config:sub(1,1) == "/" then
  pathSeparator = "/" -- Unix
else
  pathSeparator = "\\" -- Windows
end

function osjoin(a, b)
  return a .. pathSeparator .. b
end

function parent(fpath)
  local name = string.gsub(fpath, "(.*[/\\])(.*)", "%1")
  if name == fpath then
    name = "." .. pathSeparator
  end
  return name
end

function abort(msg)
  io.stderr:write(msg .. "\n")
  os.exit()
end

function getString(n)
  local dat = f:read(n)
  return dat:gsub("\x00", "")
end

function getLong()
  local long = { string.unpack("<I8", f:read(8), 1) }
  return long[1]
end

function extract(name, offset, length)
  of = io.open(name, "wb")
  f:seek("set", offset)
  of:write(f:read(length))
  of:close()
end

if #arg < 1 then
  abort("Usage: star.lua singleimage.bin [outdir]")
end

f = io.open(arg[1], "rb")

if getString(256) ~= "SINGLE_N_LONELY" then
  abort("Unsupported")
end

if arg[2] then
  outdir = arg[2]
else
  outdir = parent(arg[1]) .. "outdir"
end
os.execute("mkdir " .. outdir)

for i = 1,64 do
  name = getString(248)
  size = getLong()
  if name == "LONELY_N_SINGLE" then
    break -- no more files
  end
  io.write(string.format("Name: %s, Offset: %#x, Size: %d", name, f:seek(), size))
  extract(osjoin(outdir, name), f:seek(), size)
  pad = size % 4096
  if pad ~= 0 then
    pad = 4096 - pad
    f:read(pad)
  end
  print(", Padding: " .. pad)
end

f:close()
