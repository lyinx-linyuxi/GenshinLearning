# Representing and Manipulating Information

## Operators

- **~**: bitwise negation
- **!**: logical not
- ...

Differences between single and double:**&**, **&&** and **|**, **||**.

## implicit casting

In C, when an opration whose 2 operands has 1 unsigned and 1 two's complements', the two's complement number will be casting to the unsigned number.

an infinite loop cause by this casting:

```C
    unsigned int i = 4 * sizeof(int);
    for (i; i >= 0; i++){
        printf("%d\n", i);
    }
```

## Two's Complement

There are 2 numbers only in two's complement numbers that orginal one equals negative one:

- **0**
- **Tmin**
