#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#  @generated
#

from libcpp.string cimport string
from libcpp cimport bool as cbool
from cpython cimport bool as pbool
from libc.stdint cimport int8_t, int16_t, int32_t, int64_t
from libcpp.memory cimport shared_ptr, unique_ptr
from libcpp.vector cimport vector
from libcpp.set cimport set as cset
from libcpp.map cimport map as cmap, pair as cpair
from thrift.py3.exceptions cimport cTException
cimport thrift.py3.exceptions
cimport thrift.py3.types
from folly.optional cimport cOptional


cdef extern from "src/gen-cpp2/module_types.h" namespace "cpp2":
    cdef cppclass cAnimal "cpp2::Animal":
        bint operator==(cAnimal&)
    cAnimal Animal__DOG "cpp2::Animal::DOG"
    cAnimal Animal__CAT "cpp2::Animal::CAT"
    cAnimal Animal__TARANTULA "cpp2::Animal::TARANTULA"

cdef cAnimal Animal_to_cpp(value)

cdef extern from "src/gen-cpp2/module_types_custom_protocol.h" namespace "cpp2":
    # Forward Declaration
    cdef cppclass cColor "cpp2::Color"
    # Forward Declaration
    cdef cppclass cVehicle "cpp2::Vehicle"
    # Forward Declaration
    cdef cppclass cPerson "cpp2::Person"

cdef extern from "src/gen-cpp2/module_types.h" namespace "cpp2":
    cdef cppclass cColor__isset "cpp2::Color::__isset":
        bint red
        bint green
        bint blue
        bint alpha

    cdef cppclass cColor "cpp2::Color":
        cColor() except +
        cColor(const cColor&) except +
        bint operator==(cColor&)
        double red
        double green
        double blue
        double alpha
        cColor__isset __isset

    cdef cppclass cVehicle__isset "cpp2::Vehicle::__isset":
        bint color
        bint licensePlate
        bint description
        bint name
        bint hasAC

    cdef cppclass cVehicle "cpp2::Vehicle":
        cVehicle() except +
        cVehicle(const cVehicle&) except +
        bint operator==(cVehicle&)
        cColor color
        string licensePlate
        string description
        string name
        cbool hasAC
        cVehicle__isset __isset

    cdef cppclass cPerson__isset "cpp2::Person::__isset":
        bint id
        bint name
        bint age
        bint address
        bint favoriteColor
        bint friends
        bint bestFriend
        bint petNames
        bint afraidOfAnimal
        bint vehicles

    cdef cppclass cPerson "cpp2::Person":
        cPerson() except +
        cPerson(const cPerson&) except +
        bint operator==(cPerson&)
        int64_t id
        string name
        int16_t age
        string address
        cColor favoriteColor
        cset[int64_t] friends
        int64_t bestFriend
        cmap[cAnimal,string] petNames
        cAnimal afraidOfAnimal
        vector[cVehicle] vehicles
        cPerson__isset __isset


cdef extern from "<utility>" namespace "std" nogil:
    cdef shared_ptr[cColor] move(unique_ptr[cColor])
    cdef shared_ptr[cColor] move_shared "std::move"(shared_ptr[cColor])
    cdef unique_ptr[cColor] move_unique "std::move"(unique_ptr[cColor])
    cdef shared_ptr[cVehicle] move(unique_ptr[cVehicle])
    cdef shared_ptr[cVehicle] move_shared "std::move"(shared_ptr[cVehicle])
    cdef unique_ptr[cVehicle] move_unique "std::move"(unique_ptr[cVehicle])
    cdef shared_ptr[cPerson] move(unique_ptr[cPerson])
    cdef shared_ptr[cPerson] move_shared "std::move"(shared_ptr[cPerson])
    cdef unique_ptr[cPerson] move_unique "std::move"(unique_ptr[cPerson])

cdef extern from "<memory>" namespace "std" nogil:
    cdef shared_ptr[const cColor] const_pointer_cast "std::const_pointer_cast<const cpp2::Color>"(shared_ptr[cColor])
    cdef shared_ptr[const cVehicle] const_pointer_cast "std::const_pointer_cast<const cpp2::Vehicle>"(shared_ptr[cVehicle])
    cdef shared_ptr[const cPerson] const_pointer_cast "std::const_pointer_cast<const cpp2::Person>"(shared_ptr[cPerson])

# Forward Definition of the cython struct
cdef class Color(thrift.py3.types.Struct)

cdef class Color(thrift.py3.types.Struct):
    cdef object __hash
    cdef object __weakref__
    cdef shared_ptr[cColor] _cpp_obj

    @staticmethod
    cdef unique_ptr[cColor] _make_instance(
        cColor* base_instance,
        object red,
        object green,
        object blue,
        object alpha
    ) except *

    @staticmethod
    cdef create(shared_ptr[cColor])

# Forward Definition of the cython struct
cdef class Vehicle(thrift.py3.types.Struct)

cdef class Vehicle(thrift.py3.types.Struct):
    cdef object __hash
    cdef object __weakref__
    cdef shared_ptr[cVehicle] _cpp_obj
    cdef Color __color

    @staticmethod
    cdef unique_ptr[cVehicle] _make_instance(
        cVehicle* base_instance,
        object color,
        object licensePlate,
        object description,
        object name,
        object hasAC
    ) except *

    @staticmethod
    cdef create(shared_ptr[cVehicle])

# Forward Definition of the cython struct
cdef class Person(thrift.py3.types.Struct)

cdef class Person(thrift.py3.types.Struct):
    cdef object __hash
    cdef object __weakref__
    cdef shared_ptr[cPerson] _cpp_obj
    cdef Color __favoriteColor
    cdef Set__i64 __friends
    cdef Map__Animal_string __petNames
    cdef List__Vehicle __vehicles

    @staticmethod
    cdef unique_ptr[cPerson] _make_instance(
        cPerson* base_instance,
        object id,
        object name,
        object age,
        object address,
        object favoriteColor,
        object friends,
        object bestFriend,
        object petNames,
        object afraidOfAnimal,
        object vehicles
    ) except *

    @staticmethod
    cdef create(shared_ptr[cPerson])


cdef class Set__i64:
    cdef object __hash
    cdef object __weakref__
    cdef shared_ptr[cset[int64_t]] _cpp_obj
    @staticmethod
    cdef create(shared_ptr[cset[int64_t]])
    @staticmethod
    cdef unique_ptr[cset[int64_t]] _make_instance(object items) except *

cdef class Map__Animal_string:
    cdef object __hash
    cdef object __weakref__
    cdef shared_ptr[cmap[cAnimal,string]] _cpp_obj
    @staticmethod
    cdef create(shared_ptr[cmap[cAnimal,string]])
    @staticmethod
    cdef unique_ptr[cmap[cAnimal,string]] _make_instance(object items) except *

cdef class List__Vehicle:
    cdef object __hash
    cdef object __weakref__
    cdef shared_ptr[vector[cVehicle]] _cpp_obj
    @staticmethod
    cdef create(shared_ptr[vector[cVehicle]])
    @staticmethod
    cdef unique_ptr[vector[cVehicle]] _make_instance(object items) except *

cdef extern from "<utility>" namespace "std" nogil:
    cdef shared_ptr[cset[int64_t]] move(unique_ptr[cset[int64_t]])
    cdef unique_ptr[cset[int64_t]] move_unique "std::move"(unique_ptr[cset[int64_t]])
    cdef shared_ptr[cmap[cAnimal,string]] move(unique_ptr[cmap[cAnimal,string]])
    cdef unique_ptr[cmap[cAnimal,string]] move_unique "std::move"(unique_ptr[cmap[cAnimal,string]])
    cdef shared_ptr[vector[cVehicle]] move(unique_ptr[vector[cVehicle]])
    cdef unique_ptr[vector[cVehicle]] move_unique "std::move"(unique_ptr[vector[cVehicle]])
cdef extern from "<memory>" namespace "std" nogil:
    cdef shared_ptr[const cset[int64_t]] const_pointer_cast "std::const_pointer_cast"(shared_ptr[cset[int64_t]])

    cdef shared_ptr[const cmap[cAnimal,string]] const_pointer_cast "std::const_pointer_cast"(shared_ptr[cmap[cAnimal,string]])

    cdef shared_ptr[const vector[cVehicle]] const_pointer_cast "std::const_pointer_cast"(shared_ptr[vector[cVehicle]])

