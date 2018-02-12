#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#  @generated
#

from libcpp.memory cimport shared_ptr, make_shared, unique_ptr, make_unique
from libcpp.string cimport string
from libcpp cimport bool as cbool
from libcpp.iterator cimport inserter as cinserter
from cpython cimport bool as pbool
from libc.stdint cimport int8_t, int16_t, int32_t, int64_t, uint32_t
from cython.operator cimport dereference as deref, preincrement as inc
import thrift.py3.types
cimport thrift.py3.types
cimport thrift.py3.exceptions
from thrift.py3.types import NOTSET as __NOTSET
from thrift.py3.types cimport translate_cpp_enum_to_python
cimport thrift.py3.std_libcpp as std_libcpp
from thrift.py3.serializer cimport IOBuf
from thrift.py3.serializer import Protocol
cimport thrift.py3.serializer as serializer
from thrift.py3.serializer import deserialize, serialize
from folly.optional cimport cOptional

import sys
import itertools
from collections import Sequence, Set, Mapping, Iterable
import enum as __enum
import warnings
import builtins as _builtins


class Enum(__enum.Enum):
    ONE = 1
    TWO = 2
    THREE = 3

    __hash__ = __enum.Enum.__hash__

    def __eq__(self, other):
        if not isinstance(other, self.__class__):
            warnings.warn(f"comparison not supported between instances of {type(self)} and {type(other)}", RuntimeWarning, stacklevel=2)
            return False
        return self.value == other.value

    def __int__(self):
        return self.value

cdef inline cEnum Enum_to_cpp(value):
    cdef int cvalue = value.value
    if cvalue == 1:
        return Enum__ONE
    elif cvalue == 2:
        return Enum__TWO
    elif cvalue == 3:
        return Enum__THREE


cdef cStruct _Struct_defaults = cStruct()

cdef class Struct(thrift.py3.types.Struct):

    def __init__(
        Struct self, *,
        first=None,
        str second=None
    ):
        if first is not None:
            if not isinstance(first, int):
                raise TypeError(f'first is not a { int !r}.')
            <int32_t> first

        self._cpp_obj = move(Struct._make_instance(
          NULL,
          first,
          second,
        ))

    def __call__(
        Struct self,
        first=__NOTSET,
        second=__NOTSET
    ):
        changes = any((
            first is not __NOTSET,

            second is not __NOTSET,
        ))

        if not changes:
            return self

        if None is not first is not __NOTSET:
            if not isinstance(first, int):
                raise TypeError(f'first is not a { int !r}.')
            <int32_t> first

        if None is not second is not __NOTSET:
            if not isinstance(second, str):
                raise TypeError(f'second is not a { str !r}.')

        inst = <Struct>Struct.__new__(Struct)
        inst._cpp_obj = move(Struct._make_instance(
          self._cpp_obj.get(),
          first,
          second,
        ))
        return inst

    @staticmethod
    cdef unique_ptr[cStruct] _make_instance(
        cStruct* base_instance,
        object first,
        object second
    ) except *:
        cdef unique_ptr[cStruct] c_inst
        if base_instance:
            c_inst = make_unique[cStruct](deref(base_instance))
        else:
            c_inst = make_unique[cStruct]()

        if base_instance:
            # Convert None's to default value. (or unset)
            if first is None:
                deref(c_inst).first = _Struct_defaults.first
                deref(c_inst).__isset.first = False
                pass
            elif first is __NOTSET:
                first = None

            if second is None:
                deref(c_inst).second = _Struct_defaults.second
                deref(c_inst).__isset.second = False
                pass
            elif second is __NOTSET:
                second = None

        if first is not None:
            deref(c_inst).first = first
            deref(c_inst).__isset.first = True
        if second is not None:
            deref(c_inst).second = second.encode('UTF-8')
            deref(c_inst).__isset.second = True
        # in C++ you don't have to call move(), but this doesn't translate
        # into a C++ return statement, so you do here
        return move_unique(c_inst)

    def __iter__(self):
        yield 'first', self.first
        yield 'second', self.second

    def __bool__(self):
        return True or True

    @staticmethod
    cdef create(shared_ptr[cStruct] cpp_obj):
        inst = <Struct>Struct.__new__(Struct)
        inst._cpp_obj = cpp_obj
        return inst

    @property
    def first(self):

        return self._cpp_obj.get().first

    @property
    def second(self):

        return (<bytes>self._cpp_obj.get().second).decode('UTF-8')


    def __hash__(Struct self):
        if not self.__hash:
            self.__hash = hash((
            self.first,
            self.second,
            ))
        return self.__hash

    def __repr__(Struct self):
        return f'Struct(first={repr(self.first)}, second={repr(self.second)})'
    def __richcmp__(self, other, op):
        cdef int cop = op
        if cop not in (2, 3):
            raise TypeError("unorderable types: {}, {}".format(self, other))
        if not (
                isinstance(self, Struct) and
                isinstance(other, Struct)):
            if cop == 2:  # different types are never equal
                return False
            else:         # different types are always notequal
                return True

        cdef cStruct cself = deref((<Struct>self)._cpp_obj)
        cdef cStruct cother = deref((<Struct>other)._cpp_obj)
        cdef cbool cmp = cself == cother
        if cop == 2:
            return cmp
        return not cmp

    cdef bytes _serialize(Struct self, proto):
        cdef string c_str
        if proto is Protocol.COMPACT:
            serializer.CompactSerialize[cStruct](deref(self._cpp_obj.get()), &c_str)
        elif proto is Protocol.BINARY:
            serializer.BinarySerialize[cStruct](deref(self._cpp_obj.get()), &c_str)
        elif proto is Protocol.JSON:
            serializer.JSONSerialize[cStruct](deref(self._cpp_obj.get()), &c_str)
        return <bytes> c_str

    cdef uint32_t _deserialize(Struct self, const IOBuf* buf, proto) except? 0:
        cdef uint32_t needed
        self._cpp_obj = make_shared[cStruct]()
        if proto is Protocol.COMPACT:
            needed = serializer.CompactDeserialize[cStruct](buf, deref(self._cpp_obj.get()))
        elif proto is Protocol.BINARY:
            needed = serializer.BinaryDeserialize[cStruct](buf, deref(self._cpp_obj.get()))
        elif proto is Protocol.JSON:
            needed = serializer.JSONDeserialize[cStruct](buf, deref(self._cpp_obj.get()))
        return needed

    def __reduce__(self):
        return (deserialize, (Struct, serialize(self)))


cdef class List__Enum:
    def __init__(self, items=None):
        if isinstance(items, List__Enum):
            self._cpp_obj = (<List__Enum> items)._cpp_obj
        else:
            self._cpp_obj = move(List__Enum._make_instance(items))

    @staticmethod
    cdef create(shared_ptr[vector[cEnum]] c_items):
        inst = <List__Enum>List__Enum.__new__(List__Enum)
        inst._cpp_obj = c_items
        return inst

    @staticmethod
    cdef unique_ptr[vector[cEnum]] _make_instance(object items) except *:
        cdef unique_ptr[vector[cEnum]] c_inst = make_unique[vector[cEnum]]()
        if items is not None:
            for item in items:
                if not isinstance(item, Enum):
                    raise TypeError(f"{item!r} is not of type Enum")
                deref(c_inst).push_back(Enum_to_cpp(item))
        return move_unique(c_inst)

    def __add__(object self, object other):
        return type(self)(itertools.chain(self, other))

    def __getitem__(self, object index_obj):
        cdef shared_ptr[vector[cEnum]] c_inst
        cdef cEnum citem
        if isinstance(index_obj, slice):
            c_inst = make_shared[vector[cEnum]]()
            sz = deref(self._cpp_obj).size()
            for index in range(*index_obj.indices(sz)):
                citem = deref(self._cpp_obj.get())[index]
                deref(c_inst).push_back(citem)
            return List__Enum.create(c_inst)
        else:
            index = <int?>index_obj
            size = len(self)
            # Convert a negative index
            if index < 0:
                index = size + index
            if index >= size or index < 0:
                raise IndexError('list index out of range')
            citem = deref(self._cpp_obj.get())[index]
            return Enum(<int> citem)

    def __len__(self):
        return deref(self._cpp_obj).size()

    def __richcmp__(self, other, op):
        cdef int cop = op
        if cop not in (2, 3):
            raise TypeError("unorderable types: {}, {}".format(type(self), type(other)))
        if not (isinstance(self, Iterable) and isinstance(other, Iterable)):
            return cop != 2
        if (len(self) != len(other)):
            return cop != 2

        for one, two in zip(self, other):
            if one != two:
                return cop != 2

        return cop == 2

    def __hash__(self):
        if not self.__hash:
            self.__hash = hash(tuple(self))
        return self.__hash

    def __contains__(self, item):
        if not self or item is None:
            return False
        if not isinstance(item, Enum):
            return False
        cdef cEnum citem = Enum_to_cpp(item)
        cdef vector[cEnum] vec = deref(
            self._cpp_obj.get())
        return std_libcpp.find(vec.begin(), vec.end(), citem) != vec.end()

    def __iter__(self):
        if not self:
            raise StopIteration
        cdef cEnum citem
        for citem in deref(self._cpp_obj):
            yield Enum(<int> citem)

    def __repr__(self):
        if not self:
            return 'i[]'
        return f'i[{", ".join(map(repr, self))}]'

    def __reversed__(self):
        if not self:
            raise StopIteration
        cdef cEnum citem
        cdef vector[cEnum] vec = deref(
            self._cpp_obj.get())
        cdef vector[cEnum].reverse_iterator loc = vec.rbegin()
        while loc != vec.rend():
            citem = deref(loc)
            yield Enum(<int> citem)
            inc(loc)

    def index(self, item, start not None=__NOTSET, stop not None=__NOTSET):
        err = ValueError(f'{item} is not in list')
        if not self or item is None:
            raise err
        offset_begin = offset_end = 0
        if stop is not __NOTSET or start is not __NOTSET:
            # Like self[start:stop].index(item)
            size = len(self)
            stop = stop if stop is not __NOTSET else size
            start = start if start is not __NOTSET else 0
            # Convert stop to a negative position.
            if stop > 0:
                stop = min(stop - size, 0)
            if stop <= -size:
                raise err  # List would be empty
            offset_end = -stop
            # Convert start to always be positive
            if start < 0:
                start = max(size + start, 0)
            if start >= size:
                raise err  # past end of list
            offset_begin = start

        if not isinstance(item, Enum):
            raise err
        cdef cEnum citem = Enum_to_cpp(item)
        cdef vector[cEnum] vec = deref(self._cpp_obj.get())
        cdef vector[cEnum].iterator end = std_libcpp.prev(vec.end(), <int64_t>offset_end)
        cdef vector[cEnum].iterator loc = std_libcpp.find(
            std_libcpp.next(vec.begin(), <int64_t>offset_begin),
            end,
            citem
        )
        if loc != end:
            return <int64_t> std_libcpp.distance(vec.begin(), loc)
        raise err

    def count(self, item):
        if not self or item is None:
            return 0
        if not isinstance(item, Enum):
            return 0
        cdef cEnum citem = Enum_to_cpp(item)
        cdef vector[cEnum] vec = deref(self._cpp_obj.get())
        return <int64_t> std_libcpp.count(vec.begin(), vec.end(), citem)


Sequence.register(List__Enum)

c1 = Struct.create(make_shared[cStruct](cc1()))
e1s = List__Enum.create(make_shared[vector[cEnum]](ce1s()))
