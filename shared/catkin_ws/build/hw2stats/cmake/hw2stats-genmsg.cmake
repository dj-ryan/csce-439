# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "hw2stats: 3 messages, 0 services")

set(MSG_I_FLAGS "-Ihw2stats:/home/shared/catkin_ws/src/hw2stats/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(hw2stats_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/shared/catkin_ws/src/hw2stats/msg/gameStatsMsg.msg" NAME_WE)
add_custom_target(_hw2stats_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hw2stats" "/home/shared/catkin_ws/src/hw2stats/msg/gameStatsMsg.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/shared/catkin_ws/src/hw2stats/msg/offensivePlay.msg" NAME_WE)
add_custom_target(_hw2stats_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hw2stats" "/home/shared/catkin_ws/src/hw2stats/msg/offensivePlay.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/shared/catkin_ws/src/hw2stats/msg/rocketState.msg" NAME_WE)
add_custom_target(_hw2stats_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hw2stats" "/home/shared/catkin_ws/src/hw2stats/msg/rocketState.msg" "std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(hw2stats
  "/home/shared/catkin_ws/src/hw2stats/msg/rocketState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hw2stats
)
_generate_msg_cpp(hw2stats
  "/home/shared/catkin_ws/src/hw2stats/msg/offensivePlay.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hw2stats
)
_generate_msg_cpp(hw2stats
  "/home/shared/catkin_ws/src/hw2stats/msg/gameStatsMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hw2stats
)

### Generating Services

### Generating Module File
_generate_module_cpp(hw2stats
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hw2stats
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(hw2stats_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(hw2stats_generate_messages hw2stats_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/shared/catkin_ws/src/hw2stats/msg/gameStatsMsg.msg" NAME_WE)
add_dependencies(hw2stats_generate_messages_cpp _hw2stats_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shared/catkin_ws/src/hw2stats/msg/offensivePlay.msg" NAME_WE)
add_dependencies(hw2stats_generate_messages_cpp _hw2stats_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shared/catkin_ws/src/hw2stats/msg/rocketState.msg" NAME_WE)
add_dependencies(hw2stats_generate_messages_cpp _hw2stats_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hw2stats_gencpp)
add_dependencies(hw2stats_gencpp hw2stats_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hw2stats_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(hw2stats
  "/home/shared/catkin_ws/src/hw2stats/msg/rocketState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hw2stats
)
_generate_msg_eus(hw2stats
  "/home/shared/catkin_ws/src/hw2stats/msg/offensivePlay.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hw2stats
)
_generate_msg_eus(hw2stats
  "/home/shared/catkin_ws/src/hw2stats/msg/gameStatsMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hw2stats
)

### Generating Services

### Generating Module File
_generate_module_eus(hw2stats
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hw2stats
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(hw2stats_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(hw2stats_generate_messages hw2stats_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/shared/catkin_ws/src/hw2stats/msg/gameStatsMsg.msg" NAME_WE)
add_dependencies(hw2stats_generate_messages_eus _hw2stats_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shared/catkin_ws/src/hw2stats/msg/offensivePlay.msg" NAME_WE)
add_dependencies(hw2stats_generate_messages_eus _hw2stats_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shared/catkin_ws/src/hw2stats/msg/rocketState.msg" NAME_WE)
add_dependencies(hw2stats_generate_messages_eus _hw2stats_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hw2stats_geneus)
add_dependencies(hw2stats_geneus hw2stats_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hw2stats_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(hw2stats
  "/home/shared/catkin_ws/src/hw2stats/msg/rocketState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hw2stats
)
_generate_msg_lisp(hw2stats
  "/home/shared/catkin_ws/src/hw2stats/msg/offensivePlay.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hw2stats
)
_generate_msg_lisp(hw2stats
  "/home/shared/catkin_ws/src/hw2stats/msg/gameStatsMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hw2stats
)

### Generating Services

### Generating Module File
_generate_module_lisp(hw2stats
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hw2stats
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(hw2stats_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(hw2stats_generate_messages hw2stats_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/shared/catkin_ws/src/hw2stats/msg/gameStatsMsg.msg" NAME_WE)
add_dependencies(hw2stats_generate_messages_lisp _hw2stats_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shared/catkin_ws/src/hw2stats/msg/offensivePlay.msg" NAME_WE)
add_dependencies(hw2stats_generate_messages_lisp _hw2stats_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shared/catkin_ws/src/hw2stats/msg/rocketState.msg" NAME_WE)
add_dependencies(hw2stats_generate_messages_lisp _hw2stats_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hw2stats_genlisp)
add_dependencies(hw2stats_genlisp hw2stats_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hw2stats_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(hw2stats
  "/home/shared/catkin_ws/src/hw2stats/msg/rocketState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hw2stats
)
_generate_msg_nodejs(hw2stats
  "/home/shared/catkin_ws/src/hw2stats/msg/offensivePlay.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hw2stats
)
_generate_msg_nodejs(hw2stats
  "/home/shared/catkin_ws/src/hw2stats/msg/gameStatsMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hw2stats
)

### Generating Services

### Generating Module File
_generate_module_nodejs(hw2stats
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hw2stats
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(hw2stats_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(hw2stats_generate_messages hw2stats_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/shared/catkin_ws/src/hw2stats/msg/gameStatsMsg.msg" NAME_WE)
add_dependencies(hw2stats_generate_messages_nodejs _hw2stats_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shared/catkin_ws/src/hw2stats/msg/offensivePlay.msg" NAME_WE)
add_dependencies(hw2stats_generate_messages_nodejs _hw2stats_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shared/catkin_ws/src/hw2stats/msg/rocketState.msg" NAME_WE)
add_dependencies(hw2stats_generate_messages_nodejs _hw2stats_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hw2stats_gennodejs)
add_dependencies(hw2stats_gennodejs hw2stats_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hw2stats_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(hw2stats
  "/home/shared/catkin_ws/src/hw2stats/msg/rocketState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hw2stats
)
_generate_msg_py(hw2stats
  "/home/shared/catkin_ws/src/hw2stats/msg/offensivePlay.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hw2stats
)
_generate_msg_py(hw2stats
  "/home/shared/catkin_ws/src/hw2stats/msg/gameStatsMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hw2stats
)

### Generating Services

### Generating Module File
_generate_module_py(hw2stats
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hw2stats
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(hw2stats_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(hw2stats_generate_messages hw2stats_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/shared/catkin_ws/src/hw2stats/msg/gameStatsMsg.msg" NAME_WE)
add_dependencies(hw2stats_generate_messages_py _hw2stats_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shared/catkin_ws/src/hw2stats/msg/offensivePlay.msg" NAME_WE)
add_dependencies(hw2stats_generate_messages_py _hw2stats_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/shared/catkin_ws/src/hw2stats/msg/rocketState.msg" NAME_WE)
add_dependencies(hw2stats_generate_messages_py _hw2stats_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hw2stats_genpy)
add_dependencies(hw2stats_genpy hw2stats_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hw2stats_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hw2stats)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hw2stats
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(hw2stats_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hw2stats)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/hw2stats
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(hw2stats_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hw2stats)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hw2stats
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(hw2stats_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hw2stats)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/hw2stats
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(hw2stats_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hw2stats)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hw2stats\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hw2stats
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(hw2stats_generate_messages_py std_msgs_generate_messages_py)
endif()
