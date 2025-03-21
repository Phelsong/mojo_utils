from sys import argv
from pathlib import Path

fn main():
    var extensions = List[String](".txt", ".csv", ".py", ".sh", ".yaml",".toml" )
    var file = Path(argv()[1])

    if file.suffix() in extensions:
        try:
            print(file.read_text())
        except:
            pass
