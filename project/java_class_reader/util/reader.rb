require_relative '../core/file'
require_relative '../handler/handler'
class ClassFileAnalyser
  @@HANDLERS = []
  @@HANDLERS.push(MagicReadHandler.new)
  def self.analysis(buf)
    class_file = ClassFile.new
    @@HANDLERS.each do |handler|
      handler.read(buf, class_file)
    end
    class_file
  end
end