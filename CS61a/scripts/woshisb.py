def solve_problems():
    try:
        x = 1 / 0
    except ZeroDivisionError as e:
        raise ValueError('input error') from e
    
solve_problems()