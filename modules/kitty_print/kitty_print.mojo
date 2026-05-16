"""Kitty Graphics Protocol escape sequence generator.

Encodes image data as base64 and wraps it in Kitty terminal escape
sequences so images render inline in supported terminals (Kitty, WezTerm).

Reference: https://sw.kovidgoyal.net/kitty/graphics-protocol/
"""

from std.base64 import b64encode


def kitty_print(image_data: List[Byte]) -> String:
    """Render an image inline in a Kitty-capable terminal.

    Converts image bytes to a base64 string, splits into chunks of at
    most 4096 bytes (per Kitty protocol limits), and emits the
    appropriate escape sequences.

    Args:
        image_data: Complete image file bytes (e.g. from
            `f.read_bytes()` or converted from imencode output).

    Returns:
        The Kitty escape-sequence string. Print it to display the image.
    """
    var b64 = b64encode(image_data)
    if b64.byte_length() == 0:
        return ""

    var chunk_size = 4096
    var total_chunks = (b64.byte_length() + chunk_size - 1) // chunk_size
    var result = String()

    for chunk_idx in range(total_chunks):
        var start = chunk_idx * chunk_size
        var end = min(start + chunk_size, b64.byte_length())
        var chunk = b64[byte=start:end]

        if total_chunks == 1:
            # Single chunk — no 'm' parameter needed
            result += "\x1b_Ga=T,f=100;" + chunk + "\x1b\\"
        elif chunk_idx == 0:
            # First of multiple chunks
            result += "\x1b_Ga=T,f=100,m=1;" + chunk + "\x1b\\"
        elif chunk_idx == total_chunks - 1:
            # Last chunk
            result += "\x1b_Gm=0;" + chunk + "\x1b\\"
        else:
            # Middle chunk
            result += "\x1b_Gm=1;" + chunk + "\x1b\\"

    result += "\n"
    return result
