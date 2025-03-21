from os import getenv
from testing import assert_true
from pathlib import Path


fn main():
    var recent_cache: Path = Path(getenv("HOME")).joinpath(".local/share/recently-used.xbel")
    try:
        assert_true(recent_cache.exists())
        with open(recent_cache, "w") as fi:
            fi.write(String(""))
    except Exception:
        print("File Not Found")
