local ok, neoscroll = pcall(require,'neoscroll')

if not ok then
  error('error loading neocscroll ')
  return
end


neoscroll.setup()
