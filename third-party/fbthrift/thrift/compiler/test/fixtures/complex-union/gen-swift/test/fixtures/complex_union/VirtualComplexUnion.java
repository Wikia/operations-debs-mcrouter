/**
 * Autogenerated by Thrift
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */

package test.fixtures.complex_union;

import com.facebook.swift.codec.*;
import com.facebook.swift.codec.ThriftField.Requiredness;
import com.facebook.swift.codec.ThriftField.Recursiveness;
import java.util.*;

import static com.google.common.base.MoreObjects.toStringHelper;

@ThriftUnion("VirtualComplexUnion")
public final class VirtualComplexUnion
{
    private final Object value;
    private final int id;
    private final String name;


    @ThriftConstructor
    public VirtualComplexUnion(final String thingOne) {
        this.value = thingOne;
        this.id = 1;
        this.name = "thingOne";
    }

    @ThriftConstructor
    public VirtualComplexUnion(final String thingTwo) {
        this.value = thingTwo;
        this.id = 2;
        this.name = "thingTwo";
    }

    @ThriftField(value=1, name="thingOne", requiredness=Requiredness.NONE)
    public String getThingOne() {
        if (this.id != 1) {
            throw new IllegalStateException("Not a thingOne element!");
        }
        return (String) value;
    }

    public boolean isSetThingOne() {
        return this.id == 1;
    }

    @ThriftField(value=2, name="thingTwo", requiredness=Requiredness.NONE)
    public String getThingTwo() {
        if (this.id != 2) {
            throw new IllegalStateException("Not a thingTwo element!");
        }
        return (String) value;
    }

    public boolean isSetThingTwo() {
        return this.id == 2;
    }

    @ThriftUnionId
    public int getThriftId()
    {
        return this.id;
    }

    public String getThriftName()
    {
        return this.name;
    }

    @Override
    public String toString()
    {
        return toStringHelper(this)
            .add("value", value)
            .add("id", id)
            .add("name", name)
            .add("type", value == null ? "<null>" : value.getClass().getSimpleName())
            .toString();
    }
}
