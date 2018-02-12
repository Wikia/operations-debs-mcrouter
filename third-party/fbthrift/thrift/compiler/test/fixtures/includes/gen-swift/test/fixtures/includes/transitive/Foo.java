/**
 * Autogenerated by Thrift
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */

package test.fixtures.includes.transitive;

import com.facebook.swift.codec.*;
import com.facebook.swift.codec.ThriftField.Requiredness;
import com.facebook.swift.codec.ThriftField.Recursiveness;
import java.util.*;

import static com.google.common.base.MoreObjects.toStringHelper;

@ThriftStruct("Foo")
public final class Foo
{
    @ThriftConstructor
    public Foo(
        @ThriftField(value=1, name="a", requiredness=Requiredness.NONE) final long a
    ) {
        this.a = a;
    }

    public static class Builder {
        private long a;

        public Builder setA(long a) {
            this.a = a;
            return this;
        }

        public Builder() { }
        public Builder(Foo other) {
            this.a = other.a;
        }

        public Foo build() {
            return new Foo (
                this.a
            );
        }
    }

    private final long a;

    @ThriftField(value=1, name="a", requiredness=Requiredness.NONE)
    public long getA() { return a; }

    @Override
    public String toString()
    {
        return toStringHelper(this)
            .add("a", a)
            .toString();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }

        Foo other = (Foo)o;

        return
            Objects.equals(a, other.a);
    }

    @Override
    public int hashCode() {
        return Arrays.deepHashCode(new Object[] {
            a
        });
    }
}
