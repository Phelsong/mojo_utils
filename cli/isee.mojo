"""Display an image file inline in a Kitty-capable terminal.

Usage: isee <path.png>

Reads a PNG (or any Kitty-supported format) from disk and renders
it inline using the Kitty Graphics Protocol.
"""

from std.sys import argv
from std.pathlib import Path
from kitty_print import kitty_print


def main() raises:
    if len(argv()) < 2:
        print("Usage: see-image <image_file>")
        return

    var file_path = argv()[1]
    var path = Path(file_path)

    if not path.exists():
        print("File not found: " + file_path)
        return

    var f = open(path, "r")
    var data = f.read_bytes()
    f.close()

    var output = kitty_print(data)
    print(output)
