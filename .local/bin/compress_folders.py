#!/usr/bin/python3

import os
import os.path
import sys
import tarfile
from glob import glob


def main():
    """
    Main function
    """
    if len(sys.argv <= 1):
        print("compress_folders <command> <file_path>")
    elif sys.argv[1] == "compress":
        compress()
    elif sys.argv[1] == "decompress":
        decompress()


def compress():
    """
    compresses all folders in the specified directory
    """
    dirlist = [f for f in os.listdir(sys.argv[2]) if not os.path.isfile(f)]
    print("Files to compress")
    print(dirlist)
    # dirlist = os.listdir(sys.argv[2])
    for index, source_dir in enumerate(dirlist):
        print(f"Compressing {file_size(source_dir)}")
        print(f"{index} : {source_dir}")
        with tarfile.open(source_dir + ".tar.gz", "w:gz") as tar:
            tar.add(source_dir, arcname=os.path.basename(source_dir))
        print(f"New Size {file_size(source_dir + '.tar.gz')}")


def decompress():
    """
    decompresses all compressed folders in the specified directory
    """
    filelist = glob("*.tar.gz")
    print("Files to decompress")
    print(filelist)
    for index, source_dir in enumerate(filelist):
        print(f"Decompressing {source_dir}.tar.gz")
        print(f"{index} : {source_dir}")
        with tarfile.open(source_dir, "r:gz") as tar:
            tar.extractall()
        print(f"New Size {file_size(source_dir)}")


def file_size(filename):
    """
    Gets the file size
    returns size in human readable format
    """
    total_size = 0
    for dirpath, _, filenames in os.walk(filename):
        for f in filenames:
            fp = os.path.join(dirpath, f)
            # skip if it is symbolic link
            if not os.path.islink(fp):
                total_size += os.path.getsize(fp)

    return convert_bytes(total_size)
    # return convert_bytes(os.stat(filename).st_size)


def convert_bytes(num):
    """
    this function will convert bytes to MB.... GB... etc
    """
    for x in ["bytes", "KB", "MB", "GB", "TB"]:
        if num < 1024.0:
            return "%3.1f %s" % (num, x)
        num /= 1024.0
    return 0


if __name__ == "__main__":
    main()
