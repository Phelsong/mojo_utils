from sys import argv
from pathlib import Path, cwd

fn main():
    _here()


@always_inline
fn _here():
    try:
        if len(argv()) > 1 and argv()[1] == ".":
            print(cwd())
        else:
            var location = cwd().listdir()
            for x in location:
                print(x[])
    except:
        pass
