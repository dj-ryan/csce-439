// Generated by gencpp from file balboa_core/balboaLL.msg
// DO NOT EDIT!


#ifndef BALBOA_CORE_MESSAGE_BALBOALL_H
#define BALBOA_CORE_MESSAGE_BALBOALL_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace balboa_core
{
template <class ContainerAllocator>
struct balboaLL_
{
  typedef balboaLL_<ContainerAllocator> Type;

  balboaLL_()
    : header()
    , arduinoMillis(0)
    , batteryMillivolts(0)
    , angleY(0)
    , angleX(0)
    , angleZ(0)
    , driveLeft(0)
    , driveRight(0)
    , speedLeft(0)
    , speedRight(0)
    , distanceLeft(0)
    , distanceRight(0)  {
    }
  balboaLL_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , arduinoMillis(0)
    , batteryMillivolts(0)
    , angleY(0)
    , angleX(0)
    , angleZ(0)
    , driveLeft(0)
    , driveRight(0)
    , speedLeft(0)
    , speedRight(0)
    , distanceLeft(0)
    , distanceRight(0)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef int32_t _arduinoMillis_type;
  _arduinoMillis_type arduinoMillis;

   typedef int32_t _batteryMillivolts_type;
  _batteryMillivolts_type batteryMillivolts;

   typedef int32_t _angleY_type;
  _angleY_type angleY;

   typedef int32_t _angleX_type;
  _angleX_type angleX;

   typedef int32_t _angleZ_type;
  _angleZ_type angleZ;

   typedef int32_t _driveLeft_type;
  _driveLeft_type driveLeft;

   typedef int32_t _driveRight_type;
  _driveRight_type driveRight;

   typedef int32_t _speedLeft_type;
  _speedLeft_type speedLeft;

   typedef int32_t _speedRight_type;
  _speedRight_type speedRight;

   typedef int32_t _distanceLeft_type;
  _distanceLeft_type distanceLeft;

   typedef int32_t _distanceRight_type;
  _distanceRight_type distanceRight;





  typedef boost::shared_ptr< ::balboa_core::balboaLL_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::balboa_core::balboaLL_<ContainerAllocator> const> ConstPtr;

}; // struct balboaLL_

typedef ::balboa_core::balboaLL_<std::allocator<void> > balboaLL;

typedef boost::shared_ptr< ::balboa_core::balboaLL > balboaLLPtr;
typedef boost::shared_ptr< ::balboa_core::balboaLL const> balboaLLConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::balboa_core::balboaLL_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::balboa_core::balboaLL_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::balboa_core::balboaLL_<ContainerAllocator1> & lhs, const ::balboa_core::balboaLL_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.arduinoMillis == rhs.arduinoMillis &&
    lhs.batteryMillivolts == rhs.batteryMillivolts &&
    lhs.angleY == rhs.angleY &&
    lhs.angleX == rhs.angleX &&
    lhs.angleZ == rhs.angleZ &&
    lhs.driveLeft == rhs.driveLeft &&
    lhs.driveRight == rhs.driveRight &&
    lhs.speedLeft == rhs.speedLeft &&
    lhs.speedRight == rhs.speedRight &&
    lhs.distanceLeft == rhs.distanceLeft &&
    lhs.distanceRight == rhs.distanceRight;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::balboa_core::balboaLL_<ContainerAllocator1> & lhs, const ::balboa_core::balboaLL_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace balboa_core

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::balboa_core::balboaLL_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::balboa_core::balboaLL_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::balboa_core::balboaLL_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::balboa_core::balboaLL_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::balboa_core::balboaLL_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::balboa_core::balboaLL_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::balboa_core::balboaLL_<ContainerAllocator> >
{
  static const char* value()
  {
    return "0a0a3ddad915416071f2d2213a371653";
  }

  static const char* value(const ::balboa_core::balboaLL_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x0a0a3ddad9154160ULL;
  static const uint64_t static_value2 = 0x71f2d2213a371653ULL;
};

template<class ContainerAllocator>
struct DataType< ::balboa_core::balboaLL_<ContainerAllocator> >
{
  static const char* value()
  {
    return "balboa_core/balboaLL";
  }

  static const char* value(const ::balboa_core::balboaLL_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::balboa_core::balboaLL_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n"
"\n"
"int32 arduinoMillis\n"
"int32 batteryMillivolts\n"
"int32 angleY\n"
"int32 angleX\n"
"int32 angleZ\n"
"int32 driveLeft\n"
"int32 driveRight\n"
"int32 speedLeft\n"
"int32 speedRight\n"
"int32 distanceLeft\n"
"int32 distanceRight\n"
"\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
;
  }

  static const char* value(const ::balboa_core::balboaLL_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::balboa_core::balboaLL_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.arduinoMillis);
      stream.next(m.batteryMillivolts);
      stream.next(m.angleY);
      stream.next(m.angleX);
      stream.next(m.angleZ);
      stream.next(m.driveLeft);
      stream.next(m.driveRight);
      stream.next(m.speedLeft);
      stream.next(m.speedRight);
      stream.next(m.distanceLeft);
      stream.next(m.distanceRight);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct balboaLL_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::balboa_core::balboaLL_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::balboa_core::balboaLL_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "arduinoMillis: ";
    Printer<int32_t>::stream(s, indent + "  ", v.arduinoMillis);
    s << indent << "batteryMillivolts: ";
    Printer<int32_t>::stream(s, indent + "  ", v.batteryMillivolts);
    s << indent << "angleY: ";
    Printer<int32_t>::stream(s, indent + "  ", v.angleY);
    s << indent << "angleX: ";
    Printer<int32_t>::stream(s, indent + "  ", v.angleX);
    s << indent << "angleZ: ";
    Printer<int32_t>::stream(s, indent + "  ", v.angleZ);
    s << indent << "driveLeft: ";
    Printer<int32_t>::stream(s, indent + "  ", v.driveLeft);
    s << indent << "driveRight: ";
    Printer<int32_t>::stream(s, indent + "  ", v.driveRight);
    s << indent << "speedLeft: ";
    Printer<int32_t>::stream(s, indent + "  ", v.speedLeft);
    s << indent << "speedRight: ";
    Printer<int32_t>::stream(s, indent + "  ", v.speedRight);
    s << indent << "distanceLeft: ";
    Printer<int32_t>::stream(s, indent + "  ", v.distanceLeft);
    s << indent << "distanceRight: ";
    Printer<int32_t>::stream(s, indent + "  ", v.distanceRight);
  }
};

} // namespace message_operations
} // namespace ros

#endif // BALBOA_CORE_MESSAGE_BALBOALL_H