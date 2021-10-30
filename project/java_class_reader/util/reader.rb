require_relative '../core/file'
class ClassFileAnalyser
  @@HANDLERS = []

  def self.analysis(buf)
    class_file = ClassFile.new
    @@HANDLERS.each do |handler|
      handler.read(buf, class_file)
    end
    class_file
  end
end