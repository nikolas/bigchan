# https://github.com/thoughtbot/paperclip/issues/issue/346#comment_545077

if defined? ActionDispatch::Http::UploadedFile
  ActionDispatch::Http::UploadedFile.send(:include, Paperclip::Upfile)
end
