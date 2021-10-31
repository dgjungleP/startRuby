# frozen_string_literal: true

require_relative '../core/file'
require_relative '../core/base'
require_relative '../core/info'

class MagicReadHandler
  def read(buf, class_file)
    class_file.magic = U4.new(buf.get, buf.get, buf.get, buf.get)
    raise TypeError, 'This is not a java class file' if class_file.magic.toHexString != '0xCAFEBABE'
  end
end

class VersionReadHandler
  def read(buf, class_file)
    class_file.minor_version = U2.new(buf.get, buf.get)
    class_file.major_version = U2.new(buf.get, buf.get)
  end
end

class ConstantPoolReadHandler
  def read(buf, class_file)
    class_file.constant_pool_count = U2.new(buf.get, buf.get)
    count = class_file.constant_pool_count.to_i
    class_file.constant_pool = []
    (count - 1).times do |index|
      tag = U1.new(buf.get)
      puts "This is the #{index} Constant, The Tage is #{tag.to_i}"
      cp_info = CpInfo.get_info(tag)
      cp_info.read(buf)
      class_file.constant_pool.push(cp_info)
    end
  end
end
