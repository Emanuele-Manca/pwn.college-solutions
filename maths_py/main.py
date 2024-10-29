
OPS = "+*&^%|"
    
def match_any(str, match):
    for c in match:
        if c in str:
            return c
    return None

def find_index(str, match):
    i = 0
    while str[i] not in match:
        i += 1
        if i >= len(str):
            return -1
    return i

def token(str):
    str = str.strip(' ')
    ls, le, rs, re = str.find('('), 0, 0, str.rfind(')')

    if ls == -1:
        return str.partition(match_any(str, OPS))
    
    le = ls
    rs = re
    lc, rc = 1, 1

    while lc > 0:
        le += 1
        if str[le] == ')':
            lc -= 1
        elif str[le] == '(':
            lc += 1

    if le == re and le == len(str)-1:
        re = str.find(' ')
        op = re + 1
        return str[0:re], str[op], str[ls+1:le]
    
    while rc > 0:
        rs -= 1
        if str[rs] == ')':
            rc += 1
        elif str[rs] == '(':
            rc -= 1

    op = le + 2
    if rs == ls and rs == 0:
        rs = op + 1
        re = len(str)

    return str[ls+1:le], str[op], str[rs+1:re]
    
def compute(str):
    if match_any(str, OPS) == None:
        return int(str)
    l_str, op, r_str = token(str)
    l = compute(l_str)
    r = compute(r_str)

    ops = { 
        '+': lambda : l + r,
        '*': lambda : l * r,
        '&': lambda : l & r,
        '^': lambda : l ^ r,
        '%': lambda : l % r,
        '|': lambda : l | r,
    }
    return ops[op]()

def test(str):
    print("expr: {}".format(str))
    l, o, r = token(str)
    print("l: {}".format(l))
    print("o: {}".format(o))
    print("r: {}".format(r))
    print("res: {}\n".format(compute(str)))

def main():
    with open("./in", "r") as input:
        print("READY")
        out = open("./out", "w")
        for line in input:
            print(line)
            if line.find("CHALLENGE") < 0:
                continue
            i = find_index(line, "12345678(")-1
            #print("expr: {} from index {}".format(line[i:], i))
            res = compute(line[i:])
            #print("res: {}".format(res))
            out.write(str(res) + '\n')
            out.flush()
        out.close()
    
    print("END")

def main_network():
    import socket
    with socket.socket() as s:
        s.connect(("127.0.0.1", 1927))
        while True:
            data = s.recv(256)
           
            if not data:
                break
            line = data.decode('utf-8')
            print(line)
            if line.find("CHALLENGE") < 0:
                continue
            i = find_index(line, "12345678(")-1
            #print("expr: {} from index {}".format(line[i:], i))
            res = compute(line[i:])
            #print("res: {}".format(res))
            res = str(res) + '\n'
            s.send(bytes(res, 'utf-8'))

if __name__ == '__main__':
    # test("12 * (34*2)")
    # test("(12+3) | 4")
    # test("(12+3) | (34*2)")
    # test("94^3049")
    # main()
    main_network()