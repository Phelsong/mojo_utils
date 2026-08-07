from std.testing import assert_true


def find_substring(ref sir_str: String, ref substring: String) -> Bool:
    print("in find sub")
    try:
        assert_true(sir_str.byte_length() > 0)
        assert_true(substring.byte_length() > 0)

        for x in range(sir_str.byte_length()):
            if sir_str[byte=x] == substring[byte=0]:
                for y in range(substring.byte_length()):
                    print(substring[byte=y])
                    print(sir_str[byte=x + y])
                    assert_true(substring[byte=y] == sir_str[byte=x + y])
                return True

    except AssertionError:
        return False
    return False
