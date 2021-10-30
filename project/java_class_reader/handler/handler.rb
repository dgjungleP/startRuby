require_relative '../core/file'
require_relative '../core/base'
class MagicReadHandler

  def read(buf,classFile)
    classFile.magic=U4.new(buf[0],buf[1],buf[2],buf[3])
  end
end
