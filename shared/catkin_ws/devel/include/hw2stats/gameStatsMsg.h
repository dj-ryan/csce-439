// Generated by gencpp from file hw2stats/gameStatsMsg.msg
// DO NOT EDIT!


#ifndef HW2STATS_MESSAGE_GAMESTATSMSG_H
#define HW2STATS_MESSAGE_GAMESTATSMSG_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace hw2stats
{
template <class ContainerAllocator>
struct gameStatsMsg_
{
  typedef gameStatsMsg_<ContainerAllocator> Type;

  gameStatsMsg_()
    : header()
    , passCompleationPercentage(0.0)
    , passIncompletionPercentage(0.0)
    , totalRushingYards(0.0)
    , totalPassingYards(0.0)  {
    }
  gameStatsMsg_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , passCompleationPercentage(0.0)
    , passIncompletionPercentage(0.0)
    , totalRushingYards(0.0)
    , totalPassingYards(0.0)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef float _passCompleationPercentage_type;
  _passCompleationPercentage_type passCompleationPercentage;

   typedef float _passIncompletionPercentage_type;
  _passIncompletionPercentage_type passIncompletionPercentage;

   typedef float _totalRushingYards_type;
  _totalRushingYards_type totalRushingYards;

   typedef float _totalPassingYards_type;
  _totalPassingYards_type totalPassingYards;





  typedef boost::shared_ptr< ::hw2stats::gameStatsMsg_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::hw2stats::gameStatsMsg_<ContainerAllocator> const> ConstPtr;

}; // struct gameStatsMsg_

typedef ::hw2stats::gameStatsMsg_<std::allocator<void> > gameStatsMsg;

typedef boost::shared_ptr< ::hw2stats::gameStatsMsg > gameStatsMsgPtr;
typedef boost::shared_ptr< ::hw2stats::gameStatsMsg const> gameStatsMsgConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::hw2stats::gameStatsMsg_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::hw2stats::gameStatsMsg_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::hw2stats::gameStatsMsg_<ContainerAllocator1> & lhs, const ::hw2stats::gameStatsMsg_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.passCompleationPercentage == rhs.passCompleationPercentage &&
    lhs.passIncompletionPercentage == rhs.passIncompletionPercentage &&
    lhs.totalRushingYards == rhs.totalRushingYards &&
    lhs.totalPassingYards == rhs.totalPassingYards;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::hw2stats::gameStatsMsg_<ContainerAllocator1> & lhs, const ::hw2stats::gameStatsMsg_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace hw2stats

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::hw2stats::gameStatsMsg_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::hw2stats::gameStatsMsg_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::hw2stats::gameStatsMsg_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::hw2stats::gameStatsMsg_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::hw2stats::gameStatsMsg_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::hw2stats::gameStatsMsg_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::hw2stats::gameStatsMsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "92b53da9624eb7854546e5095f9d7940";
  }

  static const char* value(const ::hw2stats::gameStatsMsg_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x92b53da9624eb785ULL;
  static const uint64_t static_value2 = 0x4546e5095f9d7940ULL;
};

template<class ContainerAllocator>
struct DataType< ::hw2stats::gameStatsMsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "hw2stats/gameStatsMsg";
  }

  static const char* value(const ::hw2stats::gameStatsMsg_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::hw2stats::gameStatsMsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n"
"\n"
"float32 passCompleationPercentage\n"
"float32 passIncompletionPercentage\n"
"float32 totalRushingYards\n"
"float32 totalPassingYards\n"
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

  static const char* value(const ::hw2stats::gameStatsMsg_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::hw2stats::gameStatsMsg_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.passCompleationPercentage);
      stream.next(m.passIncompletionPercentage);
      stream.next(m.totalRushingYards);
      stream.next(m.totalPassingYards);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct gameStatsMsg_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::hw2stats::gameStatsMsg_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::hw2stats::gameStatsMsg_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "passCompleationPercentage: ";
    Printer<float>::stream(s, indent + "  ", v.passCompleationPercentage);
    s << indent << "passIncompletionPercentage: ";
    Printer<float>::stream(s, indent + "  ", v.passIncompletionPercentage);
    s << indent << "totalRushingYards: ";
    Printer<float>::stream(s, indent + "  ", v.totalRushingYards);
    s << indent << "totalPassingYards: ";
    Printer<float>::stream(s, indent + "  ", v.totalPassingYards);
  }
};

} // namespace message_operations
} // namespace ros

#endif // HW2STATS_MESSAGE_GAMESTATSMSG_H
