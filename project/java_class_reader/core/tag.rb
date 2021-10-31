# require_relative 'info'
#
# class ConstantClassInfo < CpInfo
#   attr_accessor :name_index
# end
#
# class ConstantFieldRefInfo < CpInfo
#   attr_accessor :class_index, :name_and_type_index
# end
#
# class ConstantMethodRefInfo < CpInfo
#   attr_accessor :class_index, :name_and_type_index
# end
#
# class ConstantInterFaceRefInfo < CpInfo
#   attr_accessor :class_index, :name_and_type_index
# end
#
# class ConstantStringInfo < CpInfo
#   attr_accessor :string_index
# end
#
# class ConstantIntegerInfo < CpInfo
#   attr_accessor :bytes
# end
#
# class ConstantFloatInfo < CpInfo
#   attr_accessor :bytes
# end
#
# class ConstantLongInfo < CpInfo
#   attr_accessor :high_bytes, :low_bytes
# end
#
# class ConstantDoubleInfo < CpInfo
#   attr_accessor :high_bytes, :low_bytes
# end
#
# class ConstantNameAndTypeInfo < CpInfo
#   attr_accessor :name_index, :description_index
# end
#
# class ConstantUtf8Info < CpInfo
#   attr_accessor :length, :bytes
# end
#
# class ConstantMethodHandleInfo < CpInfo
#   attr_accessor :reference_kind, :reference_index
# end
#
# class ConstantMethodTypeInfo < CpInfo
#   attr_accessor :description_index
# end
#
# class ConstantInvokeDynamicInfo < CpInfo
#   attr_accessor :bootstrap_method_attr_index, :name_and_type_index
# end
