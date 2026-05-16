from std.os import getenv
from std.testing import assert_true
from std.pathlib import Path


def main():
    var recent_cache: Path = Path(getenv("HOME")).joinpath(".local/share/recently-used.xbel")
    try:
        assert_true(recent_cache.exists())
        with open(recent_cache, "w") as fi:
            fi.write(String(""))
    except Exception:
        print("File Not Found")
