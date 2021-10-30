# frozen_string_literal: true

require 'stringio'
require_relative '../util/reader'
full_text = File.read('../resource/HelloWorld.class')
buf = Array.new(full_text.bytes)

class_file = ClassFileAnalyser.analysis(buf)
puts class_file.magic.toHexString
