BEGIN {
    size  = 0
    error = "Stack is empty"
}

/^push/ {
    #
    # Push the argument on the stack. We use split to retrieve
    # the argument. split() puts the various parts into its
    # second argument -- an array. Note that arrays are indexed 1-based.
    #
    split($0, a, / +/)
    stack [size += 1] = a [2]
}

/^pop/  {
    #
    # Popping just means reducing the size of the stack by 1.
    # Don't let it go below 0.
    #
    size = size ? size - 1 : 0
}

/^top/  {
    #
    # Print the top of the stack, or an error if the stack is empty.
    #
    print size ? stack [size] : error
}

/^min/  {
    #
    # Find the minimum number in the stack, which we find by iterating
    # over the array which represents the stack. If the stack is
    # empty, we print an error message.
    #
    if (size) {
        min = stack [1]
        for (i = 2; i <= size; i ++) {
            if (min > stack [i]) {
                min = stack [i]
            }
        }
        print min
    }
    else {
        print error
    }
}
