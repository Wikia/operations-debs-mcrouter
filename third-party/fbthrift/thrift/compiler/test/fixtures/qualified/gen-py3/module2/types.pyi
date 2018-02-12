#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#  @generated
#

import thrift.py3.types
import thrift.py3.exceptions
from thrift.py3.types import NOTSET, NOTSETTYPE
from thrift.py3.serializer import Protocol
import typing as _typing

import sys
import itertools
import enum as __enum
import module0.types as _module0_types
import module1.types as _module1_types


class Struct(thrift.py3.types.Struct, _typing.Hashable, _typing.Iterable[_typing.Tuple[str, _typing.Any]]):
    def __init__(
        self, *,
        first: _typing.Optional[_module0_types.Struct]=None,
        second: _typing.Optional[_module1_types.Struct]=None
    ) -> None: ...

    def __call__(
        self, *,
        first: _typing.Union[_module0_types.Struct, NOTSETTYPE, None]=NOTSET,
        second: _typing.Union[_module1_types.Struct, NOTSETTYPE, None]=NOTSET
    ) -> Struct: ...

    def __reduce__(self) -> _typing.Tuple[_typing.Callable, _typing.Tuple[_typing.Type['Struct'], bytes]]: ...
    def __iter__(self) -> _typing.Iterator[_typing.Tuple[str, _typing.Any]]: ...
    def __bool__(self) -> bool: ...
    def __hash__(self) -> int: ...
    def __repr__(self) -> str: ...
    def __lt__(self, other: 'Struct') -> bool: ...

    @property
    def first(self) -> _module0_types.Struct: ...
    @property
    def second(self) -> _module1_types.Struct: ...


class BigStruct(thrift.py3.types.Struct, _typing.Hashable, _typing.Iterable[_typing.Tuple[str, _typing.Any]]):
    def __init__(
        self, *,
        s: _typing.Optional['Struct']=None,
        id: _typing.Optional[int]=None
    ) -> None: ...

    def __call__(
        self, *,
        s: _typing.Union['Struct', NOTSETTYPE, None]=NOTSET,
        id: _typing.Union[int, NOTSETTYPE, None]=NOTSET
    ) -> BigStruct: ...

    def __reduce__(self) -> _typing.Tuple[_typing.Callable, _typing.Tuple[_typing.Type['BigStruct'], bytes]]: ...
    def __iter__(self) -> _typing.Iterator[_typing.Tuple[str, _typing.Any]]: ...
    def __bool__(self) -> bool: ...
    def __hash__(self) -> int: ...
    def __repr__(self) -> str: ...
    def __lt__(self, other: 'BigStruct') -> bool: ...

    @property
    def s(self) -> 'Struct': ...
    @property
    def id(self) -> int: ...


c2: Struct = ...
c3: Struct = ...
c4: Struct = ...
