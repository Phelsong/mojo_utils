from std.sys import argv
from std.pathlib import Path, cwd


def main():
    await _here()


@always_inline
async def _here():
    try:
        if len(argv()) > 1 and argv()[1] == ".":
            print(cwd())
        else:
            var location = cwd().listdir()
            for x in location:
                print(x)
    except:
        pass
