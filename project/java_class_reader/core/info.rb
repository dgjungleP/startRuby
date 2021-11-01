# frozen_string_literal: true

require_relative 'tag'

class CpInfo
  attr_accessor :tag

  def initialize(tag)
    @tag = tag
  end

  def self.get_info(tag)
    case tag.to_i
    when 1
      ConstantUtf8Info.new(tag)
    when 3
      ConstantIntegerInfo.new(tag)
    when 4
      ConstantFloatInfo.new(tag)
    when 5
      ConstantLongInfo.new(tag)
    when 6
      ConstantDoubleInfo.new(tag)
    when 7
      ConstantClassInfo.new(tag)
    when 8
      ConstantStringInfo.new(tag)
    when 9
      ConstantFieldRefInfo.new(tag)
    when 10
      ConstantMethodRefInfo.new(tag)
    when 11
      ConstantInterFaceRefInfo.new(tag)
    when 12
      ConstantNameAndTypeInfo.new(tag)
    when 15
      ConstantMethodHandleInfo.new(tag)
    when 16
      ConstantMethodTypeInfo.new(tag)
    when 18
      ConstantInvokeDynamicInfo.new(tag)
    else
      raise TypeError, "Can not find the Tag=#{tag.to_i} type"
    end
  end

  def to_s
    "tag=#{@tag.toHexString}"
  end
end

class FieldInfo
  attr_accessor :access_flages, :name_index, :descriptor_index, :attributes_count, :attributes
end

class MethodInfo
  attr_accessor :access_flages, :name_index, :descriptor_index, :attributes_count, :attributes
end

class AttributeInfo
  attr_accessor :attribute_name_index, :attributeLength, :info
end

class ConstantClassInfo < CpInfo
  attr_accessor :name_index

  def read(buf)
    @name_index = U2.new(buf.get_2)
  end
end

class ConstantFieldRefInfo < CpInfo
  attr_accessor :class_index, :name_and_type_index

  def read(buf)
    @class_index = U2.new(buf.get_2)
    @name_and_type_index = U2.new(buf.get_2)
  end
end

class ConstantMethodRefInfo < CpInfo
  attr_accessor :class_index, :name_and_type_index

  def read(buf)
    @class_index = U2.new(buf.get_2)
    @name_and_type_index = U2.new(buf.get_2)
  end
end

class ConstantInterFaceRefInfo < CpInfo
  attr_accessor :class_index, :name_and_type_index

  def read(buf)
    @class_index = U2.new(buf.get_2)
    @name_and_type_index = U2.new(buf.get_2)
  end
end

class ConstantStringInfo < CpInfo
  attr_accessor :string_index

  def read(buf)
    @string_index = U2.new(buf.get_2)
  end
end

class ConstantIntegerInfo < CpInfo
  attr_accessor :bytes

  def read(buf)
    @bytes = U4.new(buf.get_4)
  end
end

class ConstantFloatInfo < CpInfo
  attr_accessor :bytes

  def read(buf)
    @bytes = U4.new(buf.get_4)
  end
end

class ConstantLongInfo < CpInfo
  attr_accessor :high_bytes, :low_bytes

  def read(buf)
    @high_bytes = U4.new(buf.get_4)
    @low_bytes = U4.new(buf.get_4)
  end
end

class ConstantDoubleInfo < CpInfo
  attr_accessor :high_bytes, :low_bytes

  def read(buf)
    @high_bytes = U4.new(buf.get_4)
    @low_bytes = U4.new(buf.get_4)
  end
end

class ConstantNameAndTypeInfo < CpInfo
  attr_accessor :name_index, :description_index

  def read(buf)
    @name_index = U2.new(buf.get_2)
    @description_index = U2.new(buf.get_2)
  end
end

class ConstantUtf8Info < CpInfo
  attr_accessor :length, :bytes

  def read(buf)
    @length = U2.new(buf.get_2)
    @bytes = []
    @length.to_i.times { @bytes << U1.new(buf.get) }
  end

  def to_s
    pre = super
    str = bytes.flat_map(&:value).pack('U*')
    "#{pre},length=#{length.to_i},str=#{str}"
  end
end

class ConstantMethodHandleInfo < CpInfo
  attr_accessor :reference_kind, :reference_index

  def read(buf)
    @reference_kind = U1.new(buf.get)
    @reference_index = U2.new(buf.get_2)
  end
end

class ConstantMethodTypeInfo < CpInfo
  attr_accessor :description_index

  def read(buf)
    @description_index = U2.new(buf.get_2)
  end
end

class ConstantInvokeDynamicInfo < CpInfo
  attr_accessor :bootstrap_method_attr_index, :name_and_type_index

  def read(buf)
    @bootstrap_method_attr_index = U2.new(buf.get)
    @name_and_type_index = U2.new(buf.get)
  end
end
