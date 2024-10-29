import os

pid = os.fork()

if pid == 0:
    # child
    os.dup2(0, 242)
    os.execv("/challenge/embryoio_level107", ["as"])
else:
    # parent
    os.wait()
