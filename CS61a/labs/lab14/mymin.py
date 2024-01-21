l = [
    ('a', 1),
    ('b', 2),
    ('c', 1)
]

key, count = min(l, key=lambda x: x[1])
print(key, count)