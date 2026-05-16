from std.sys import argv
from std.pathlib import Path


def main():
    var extensions = List[String](".txt", ".csv", ".py", ".sh", ".yaml", ".toml")
    var file = Path(argv()[1])

    if file.suffix() in extensions:
        try:
            print(file.read_text())
        except:
            pass
