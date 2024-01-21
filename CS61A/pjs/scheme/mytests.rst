This file holds the tests that you create. Remember to import the python file(s)
you wish to test, along with any other modules you may need.
Run your tests with "python3 ok -t --suite SUITE_NAME --case CASE_NAME -v"
--------------------------------------------------------------------------------

Suite 1

    >>> from scheme_reader import *

    Case Example
        >>> scheme_read(Buffer(tokenize_lines(['nil'])))
        nil

Suite 2

    >>> from scheme_builtins import *
    >>> from scheme_reader import *
    >>> from scheme import *

    Case Example
        >>> scheme_read(Buffer(tokenize_lines(['(display 1)'])))
        Pair('display', Pair(1, nil))

        >>> enc = create_global_frame()
        >>> scheme_eval(scheme_read(Buffer(tokenize_lines(['(display 1)']))), enc)
        1

        >>> read_line('(define (make-rat n d) (list n d))')