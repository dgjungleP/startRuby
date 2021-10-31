# frozen_string_literal: true

require 'stringio'
require_relative '../util/reader'
full_text = File.read('../resource/HelloWorld.class')
buf = Array.new(full_text.bytes)

class_file = ClassFileAnalyser.analysis(ByteBuffer.new(buf))
puts class_file.magic.toHexString
puts class_file.major_version.to_i
puts class_file.minor_version.to_i
puts class_file.constant_pool_count.to_i
