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
        ${FLEX_Lexer_OUTPUTS})
target_compile_options(lexer PRIVATE "-Wno-sign-compare" "-Wno-unused-function")

add_library(parser
        OBJECT
        ${FLEX_Lexer_OUTPUT_HEADER}
        ${BISON_Parser_OUTPUTS})

add_library(common
        STATIC
        $<TARGET_OBJECTS:lexer>
        $<TARGET_OBJECTS:parser>)

add_executable(programm
        programm.c
        ${FLEX_Lexer_OUTPUT_HEADER}
        ${BISON_Parser_OUTPUT_HEADER})

target_include_directories(programm
        PRIVATE
        ${GLIB2_INCLUDE_DIRS})

target_link_libraries(programm
        common
        ${GLIB2_LDFLAGS})
