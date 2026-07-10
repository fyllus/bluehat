#!/usr/bin/python
from pathlib import Path


def get_memory_info():
    mem = Path("/proc/meminfo").read_text().splitlines()
    out = {}
    for m in mem:
        n, _, v = m.partition(":")
        key = n.strip()
        value = v.strip()
        out[key] = value
    return out

v = get_memory_info()

int_total = v["MemTotal"].rstrip("KB").strip()
int_distp =

print(get_memory_info())
