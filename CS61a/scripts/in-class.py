def sum_rec(n):
    if n == 0:
        return 0
    return n + sum_rec(n - 1)

def sum_iter(n):
    total = 0
    for i in range(n + 1):
        total += i
    return total

def reverse_rec(s):
    if s == '':
        return ''
    return reverse_rec(s[1:]) + s[0]

n = 5
print(sum_rec(n))
print(sum_iter(n))

print(r'hello1 \n next line1')
print(r"hello2 \n next line2")

print('hell' in "think in detail")