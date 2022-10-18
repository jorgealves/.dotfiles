local ok, comment = pcall(require, 'Comment')
if not ok then
  error('Comment not loaded')
end

comment.setup()
