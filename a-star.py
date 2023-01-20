from queue import PriorityQueue


def get_weight(A, dit):
    sumi = 0
    for i, ch in enumerate(A):
        sumi += abs(i - dit[ch])
    return sumi


def search(parent, goal, dit):
    if parent == goal: return [goal]
    child_no = len(parent) - 1
    visited, path = set([parent]), []
    pq = PriorityQueue()
    pq.put((110000, 'maxi'))
    A = list(parent)
    pq.put((get_weight(A, dit), parent))
    while pq.qsize() > 1:
        _, S = pq.get()
        path.append(S)
        if S == goal: break
        A = list(S)
        for i in range(child_no):
            A[i], A[i + 1] = A[i + 1], A[i]
            if ''.join(A) not in visited:
                pq.put((get_weight(A, dit), ''.join(A)))
                visited.add(''.join(A))
            A[i], A[i + 1] = A[i + 1], A[i]
    return path


def a_star(start, goal):
    maxi, dit = len(start), {}
    for i, ch in enumerate(goal):
        dit[ch] = min(dit.get(ch, maxi), i)
    visited = set()
    result = search(start, goal, dit)
    if result[-1] == goal: return result
    else:
        print('No solution exists')
        return []


if __name__ == '__main__':
    start = 'hema'
    goal = 'mahe'
    print('\nStarting ...\n')
    result = a_star(start, goal)
    for i, val in enumerate(result):
        print(f'{i + 1}) {val}')
    print()
