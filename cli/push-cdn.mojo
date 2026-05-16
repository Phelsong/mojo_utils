from std.sys import argv
from std.os import getenv
from std.testing import assert_true
from std.pathlib import Path


# TODO: validate file hashes
def main():
    try:
        if len(argv()) > 1:
            var file_path = Path(argv()[1])
            assert_true(file_path.exists())
            await cdn_push(file_path)
    except:
        print("File Not Found")


@always_inline
async def cdn_push(file: Path) raises:
    var cdn_root: Path = Path("/mnt/smb/cdn")
    var name = String(file.__str__().split("/")[-1])
    var name_no_suffix = String(name.split(".")[0])
    try:
        assert_true(cdn_root.is_dir())
        assert_true(file.exists())
        if Path(name_no_suffix) in cdn_root.listdir():
            pkg_root = cdn_root.joinpath(name_no_suffix).joinpath(name)
            pkg_root.write_bytes(file.read_bytes())
        else:
            cdn_root.joinpath(name).write_bytes(file.read_bytes())
    except:
        print("error pushing")
