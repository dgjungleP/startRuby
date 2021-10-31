require_relative '../core/file'
require_relative '../handler/handler'

class ClassFileAnalyser
  @@HANDLERS = []
  @@HANDLERS.push(MagicReadHandler.new)
  @@HANDLERS.push(VersionReadHandler.new)
  @@HANDLERS.push(ConstantPoolReadHandler.new)

  def self.analysis(buf)
    class_file = ClassFile.new
    @@HANDLERS.each do |handler|
      handler.read(buf, class_file)
    end
    class_file
  end
end

class ByteBuffer
  attr_writer :position

  def initialize(value)
    @values = value
    @position = 0
  end

  def get
    result = @values[@position]
    @position += 1
    result
  end

  private def method_missing(symbol, *args)
    match = /get_(\d*)/.match(symbol)
    if match
      result = []
      match[1].to_i.times { result << get }
      result
    else
      super
    end
  end
end