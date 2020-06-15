list(APPEND _tests
        parser_test)

foreach(_test IN LISTS _tests)
    add_executable(${_test} ${_test}.c)

    target_include_directories(${_test}
            PRIVATE
            ${GLIB2_INCLUDE_DIRS})

    target_link_libraries(${_test}
            ${GLIB2_LDFLAGS})
endforeach()

enable_testing()


add_test(
        NAME parser_test
        COMMAND $<TARGET_FILE:parser_test>
)

#[[add_test(
        NAME merge_sort_test
        COMMAND $<TARGET_FILE:test_merge_sort>
)]]
