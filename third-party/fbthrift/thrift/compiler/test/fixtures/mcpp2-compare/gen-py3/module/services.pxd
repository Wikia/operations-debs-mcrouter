#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#  @generated
#

from thrift.py3.server cimport ServiceInterface


cdef class EmptyServiceInterface(ServiceInterface):
    pass

cdef class ReturnServiceInterface(ServiceInterface):
    cdef public bint _pass_context_noReturn
    cdef public bint _pass_context_boolReturn
    cdef public bint _pass_context_i16Return
    cdef public bint _pass_context_i32Return
    cdef public bint _pass_context_i64Return
    cdef public bint _pass_context_floatReturn
    cdef public bint _pass_context_doubleReturn
    cdef public bint _pass_context_stringReturn
    cdef public bint _pass_context_binaryReturn
    cdef public bint _pass_context_mapReturn
    cdef public bint _pass_context_simpleTypedefReturn
    cdef public bint _pass_context_complexTypedefReturn
    cdef public bint _pass_context_list_mostComplexTypedefReturn
    cdef public bint _pass_context_enumReturn
    cdef public bint _pass_context_list_EnumReturn
    cdef public bint _pass_context_structReturn
    cdef public bint _pass_context_set_StructReturn
    cdef public bint _pass_context_unionReturn
    cdef public bint _pass_context_list_UnionReturn
    cdef public bint _pass_context_readDataEb
    cdef public bint _pass_context_readData
    pass

cdef class ParamServiceInterface(ServiceInterface):
    cdef public bint _pass_context_void_ret_i16_param
    cdef public bint _pass_context_void_ret_byte_i16_param
    cdef public bint _pass_context_void_ret_map_param
    cdef public bint _pass_context_void_ret_map_setlist_param
    cdef public bint _pass_context_void_ret_map_typedef_param
    cdef public bint _pass_context_void_ret_enum_param
    cdef public bint _pass_context_void_ret_struct_param
    cdef public bint _pass_context_void_ret_listunion_param
    cdef public bint _pass_context_bool_ret_i32_i64_param
    cdef public bint _pass_context_bool_ret_map_param
    cdef public bint _pass_context_bool_ret_union_param
    cdef public bint _pass_context_i64_ret_float_double_param
    cdef public bint _pass_context_i64_ret_string_typedef_param
    cdef public bint _pass_context_i64_ret_i32_i32_i32_i32_i32_param
    cdef public bint _pass_context_double_ret_setstruct_param
    cdef public bint _pass_context_string_ret_string_param
    cdef public bint _pass_context_binary_ret_binary_param
    cdef public bint _pass_context_map_ret_bool_param
    cdef public bint _pass_context_list_ret_map_setlist_param
    cdef public bint _pass_context_mapsetlistmapliststring_ret_listlistlist_param
    cdef public bint _pass_context_typedef_ret_i32_param
    cdef public bint _pass_context_listtypedef_ret_typedef_param
    cdef public bint _pass_context_enum_ret_double_param
    cdef public bint _pass_context_enum_ret_double_enum_param
    cdef public bint _pass_context_listenum_ret_map_param
    cdef public bint _pass_context_struct_ret_i16_param
    cdef public bint _pass_context_setstruct_ret_set_param
    cdef public bint _pass_context_union_ret_i32_i32_param
    cdef public bint _pass_context_listunion_string_param
    pass

