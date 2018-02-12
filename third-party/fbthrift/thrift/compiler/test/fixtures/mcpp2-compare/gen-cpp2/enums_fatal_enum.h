/**
 * Autogenerated by Thrift
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
#pragma once

#include "thrift/compiler/test/fixtures/mcpp2-compare/gen-cpp2/enums_types.h"
#include "thrift/compiler/test/fixtures/mcpp2-compare/gen-cpp2/enums_fatal.h"

#include <fatal/type/enum.h>

#include <type_traits>

namespace facebook { namespace ns { namespace qwerty {

namespace thrift_fatal_impl_detail {

struct AnEnumA_enum_traits {
  using type = ::facebook::ns::qwerty::AnEnumA;
  using name = thrift_fatal_impl_detail::facebook_ns_qwerty_enums__unique_strings_list::AnEnumA;

  struct AnEnumA__struct_unique_strings_list {
    using FIELDA = thrift_fatal_impl_detail::facebook_ns_qwerty_enums__unique_strings_list::FIELDA;
  };

  struct AnEnumA__struct_enum_members_FIELDA {
    using name = AnEnumA__struct_unique_strings_list::FIELDA;
    using value = std::integral_constant<type, type::FIELDA>;

    class annotations {
      public:
      using keys = void;
      using values = void;
      using map = ::fatal::list<
      >;
    };
  };

  struct AnEnumA__struct_enum_members {
    using FIELDA = AnEnumA__struct_enum_members_FIELDA;
  };

  using member = AnEnumA__struct_enum_members;

  using fields = ::fatal::list<
      member::FIELDA
  >;

  class annotations {
    public:
    using keys = void;
    using values = void;
    using map = ::fatal::list<
    >;
  };

  static char const *to_string(type e, char const *fallback) {
    switch (e) {
      case type::FIELDA: return "FIELDA";
      default: return fallback;
    }
  }
};

} // thrift_fatal_impl_detail

FATAL_REGISTER_ENUM_TRAITS(
  ::facebook::ns::qwerty::thrift_fatal_impl_detail::AnEnumA_enum_traits,
  ::apache::thrift::detail::type_common_metadata_impl<
    enums_tags::module,
    ::apache::thrift::reflected_annotations<::facebook::ns::qwerty::thrift_fatal_impl_detail::AnEnumA_enum_traits::annotations>,
    static_cast<::apache::thrift::legacy_type_id_t>(428815433984633608ull)
  >
);
namespace thrift_fatal_impl_detail {

struct AnEnumB_enum_traits {
  using type = ::facebook::ns::qwerty::AnEnumB;
  using name = thrift_fatal_impl_detail::facebook_ns_qwerty_enums__unique_strings_list::AnEnumB;

  struct AnEnumB__struct_unique_strings_list {
    using FIELDA = thrift_fatal_impl_detail::facebook_ns_qwerty_enums__unique_strings_list::FIELDA;
    using FIELDB = thrift_fatal_impl_detail::facebook_ns_qwerty_enums__unique_strings_list::FIELDB;
  };

  struct AnEnumB__struct_enum_members_FIELDA {
    using name = AnEnumB__struct_unique_strings_list::FIELDA;
    using value = std::integral_constant<type, type::FIELDA>;

    class annotations {
      public:
      using keys = void;
      using values = void;
      using map = ::fatal::list<
      >;
    };
  };

  struct AnEnumB__struct_enum_members_FIELDB {
    using name = AnEnumB__struct_unique_strings_list::FIELDB;
    using value = std::integral_constant<type, type::FIELDB>;

    class annotations {
      public:
      using keys = void;
      using values = void;
      using map = ::fatal::list<
      >;
    };
  };

  struct AnEnumB__struct_enum_members {
    using FIELDA = AnEnumB__struct_enum_members_FIELDA;
    using FIELDB = AnEnumB__struct_enum_members_FIELDB;
  };

  using member = AnEnumB__struct_enum_members;

  using fields = ::fatal::list<
      member::FIELDA,
      member::FIELDB
  >;

  class annotations {
    public:
    using keys = void;
    using values = void;
    using map = ::fatal::list<
    >;
  };

  static char const *to_string(type e, char const *fallback) {
    switch (e) {
      case type::FIELDA: return "FIELDA";
      case type::FIELDB: return "FIELDB";
      default: return fallback;
    }
  }
};

} // thrift_fatal_impl_detail

FATAL_REGISTER_ENUM_TRAITS(
  ::facebook::ns::qwerty::thrift_fatal_impl_detail::AnEnumB_enum_traits,
  ::apache::thrift::detail::type_common_metadata_impl<
    enums_tags::module,
    ::apache::thrift::reflected_annotations<::facebook::ns::qwerty::thrift_fatal_impl_detail::AnEnumB_enum_traits::annotations>,
    static_cast<::apache::thrift::legacy_type_id_t>(15617140791710839720ull)
  >
);
namespace thrift_fatal_impl_detail {

struct AnEnumC_enum_traits {
  using type = ::facebook::ns::qwerty::AnEnumC;
  using name = thrift_fatal_impl_detail::facebook_ns_qwerty_enums__unique_strings_list::AnEnumC;

  struct AnEnumC__struct_unique_strings_list {
    using FIELDC = thrift_fatal_impl_detail::facebook_ns_qwerty_enums__unique_strings_list::FIELDC;
  };

  struct AnEnumC__struct_enum_members_FIELDC {
    using name = AnEnumC__struct_unique_strings_list::FIELDC;
    using value = std::integral_constant<type, type::FIELDC>;

    class annotations {
      public:
      using keys = void;
      using values = void;
      using map = ::fatal::list<
      >;
    };
  };

  struct AnEnumC__struct_enum_members {
    using FIELDC = AnEnumC__struct_enum_members_FIELDC;
  };

  using member = AnEnumC__struct_enum_members;

  using fields = ::fatal::list<
      member::FIELDC
  >;

  class annotations {
    public:
    using keys = void;
    using values = void;
    using map = ::fatal::list<
    >;
  };

  static char const *to_string(type e, char const *fallback) {
    switch (e) {
      case type::FIELDC: return "FIELDC";
      default: return fallback;
    }
  }
};

} // thrift_fatal_impl_detail

FATAL_REGISTER_ENUM_TRAITS(
  ::facebook::ns::qwerty::thrift_fatal_impl_detail::AnEnumC_enum_traits,
  ::apache::thrift::detail::type_common_metadata_impl<
    enums_tags::module,
    ::apache::thrift::reflected_annotations<::facebook::ns::qwerty::thrift_fatal_impl_detail::AnEnumC_enum_traits::annotations>,
    static_cast<::apache::thrift::legacy_type_id_t>(2370933752103673064ull)
  >
);
namespace thrift_fatal_impl_detail {

struct AnEnumD_enum_traits {
  using type = ::facebook::ns::qwerty::AnEnumD;
  using name = thrift_fatal_impl_detail::facebook_ns_qwerty_enums__unique_strings_list::AnEnumD;

  struct AnEnumD__struct_unique_strings_list {
    using FIELDD = thrift_fatal_impl_detail::facebook_ns_qwerty_enums__unique_strings_list::FIELDD;
  };

  struct AnEnumD__struct_enum_members_FIELDD {
    using name = AnEnumD__struct_unique_strings_list::FIELDD;
    using value = std::integral_constant<type, type::FIELDD>;

    class annotations {
      public:
      using keys = void;
      using values = void;
      using map = ::fatal::list<
      >;
    };
  };

  struct AnEnumD__struct_enum_members {
    using FIELDD = AnEnumD__struct_enum_members_FIELDD;
  };

  using member = AnEnumD__struct_enum_members;

  using fields = ::fatal::list<
      member::FIELDD
  >;

  class annotations {
    public:
    using keys = void;
    using values = void;
    using map = ::fatal::list<
    >;
  };

  static char const *to_string(type e, char const *fallback) {
    switch (e) {
      case type::FIELDD: return "FIELDD";
      default: return fallback;
    }
  }
};

} // thrift_fatal_impl_detail

FATAL_REGISTER_ENUM_TRAITS(
  ::facebook::ns::qwerty::thrift_fatal_impl_detail::AnEnumD_enum_traits,
  ::apache::thrift::detail::type_common_metadata_impl<
    enums_tags::module,
    ::apache::thrift::reflected_annotations<::facebook::ns::qwerty::thrift_fatal_impl_detail::AnEnumD_enum_traits::annotations>,
    static_cast<::apache::thrift::legacy_type_id_t>(2735336584205230696ull)
  >
);
namespace thrift_fatal_impl_detail {

struct AnEnumE_enum_traits {
  using type = ::facebook::ns::qwerty::AnEnumE;
  using name = thrift_fatal_impl_detail::facebook_ns_qwerty_enums__unique_strings_list::AnEnumE;

  struct AnEnumE__struct_unique_strings_list {
    using FIELDA = thrift_fatal_impl_detail::facebook_ns_qwerty_enums__unique_strings_list::FIELDA;
  };

  struct AnEnumE__struct_enum_members_FIELDA {
    using name = AnEnumE__struct_unique_strings_list::FIELDA;
    using value = std::integral_constant<type, type::FIELDA>;

    class annotations {
      public:
      using keys = void;
      using values = void;
      using map = ::fatal::list<
      >;
    };
  };

  struct AnEnumE__struct_enum_members {
    using FIELDA = AnEnumE__struct_enum_members_FIELDA;
  };

  using member = AnEnumE__struct_enum_members;

  using fields = ::fatal::list<
      member::FIELDA
  >;

  class annotations {
    public:
    using keys = void;
    using values = void;
    using map = ::fatal::list<
    >;
  };

  static char const *to_string(type e, char const *fallback) {
    switch (e) {
      case type::FIELDA: return "FIELDA";
      default: return fallback;
    }
  }
};

} // thrift_fatal_impl_detail

FATAL_REGISTER_ENUM_TRAITS(
  ::facebook::ns::qwerty::thrift_fatal_impl_detail::AnEnumE_enum_traits,
  ::apache::thrift::detail::type_common_metadata_impl<
    enums_tags::module,
    ::apache::thrift::reflected_annotations<::facebook::ns::qwerty::thrift_fatal_impl_detail::AnEnumE_enum_traits::annotations>,
    static_cast<::apache::thrift::legacy_type_id_t>(9931005972636376296ull)
  >
);

}}} // facebook::ns::qwerty
