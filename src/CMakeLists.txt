set(CMAKE_INCLUDE_CURRENT_DIR_IN_INTERFACE  ON)

find_package(BISON REQUIRED)
find_package(FLEX REQUIRED)

# SET(FlexOutput ${CMAKE_SOURCE_DIR}/lexer.c)

flex_target(Lexer lexer.l
        ${CMAKE_CURRENT_SOURCE_DIR}/lexer.c
        COMPILE_FLAGS "--header-file=lexer.h")

bison_target(Parser parser.y
        ${CMAKE_CURRENT_SOURCE_DIR}/parser.c
        DEFINES_FILE ${CMAKE_CURRENT_SOURCE_DIR}/parser.h
        COMPILE_FLAGS "-v -t -d")

add_library(lexer
        OBJECT
        lexer.h
        lexer.c)

add_library(parser
        OBJECT
        lexer.h
        parser.h
        parser.c)

add_library(common
        STATIC
        $<TARGET_OBJECTS:lexer>
        $<TARGET_OBJECTS:parser>)

list(APPEND _targets
        programm)

foreach(_target IN LISTS _targets)
    add_executable(${_target}
            ${_target}.c
            ${FLEX_Lexer_OUTPUTS})

    target_include_directories(${_target}
            PRIVATE
            ${GLIB2_INCLUDE_DIRS})

    target_link_libraries(${_target}
            common
            ${GLIB2_LDFLAGS})
endforeach()
