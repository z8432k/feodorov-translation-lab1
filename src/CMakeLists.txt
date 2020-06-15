set(CMAKE_INCLUDE_CURRENT_DIR_IN_INTERFACE  ON)


add_library(common
        STATIC
                $<TARGET_OBJECTS:lexer>
                $<TARGET_OBJECTS:parser>)
target_include_directories(common
        INTERFACE
        parser)

add_executable(programm
        programm.c)

target_include_directories(programm
        PRIVATE
                ${GLIB2_INCLUDE_DIRS})

target_link_libraries(programm
        PRIVATE
                common
                ${GLIB2_LDFLAGS})

add_subdirectory(parser)
