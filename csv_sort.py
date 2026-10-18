#!/usr/bin/env python
import argparse
import sys


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument('-k', type=int, metavar='SORT_FIELD_NUM')
    parser.add_argument('-t', metavar='DELIM')
    parser.add_argument('file', nargs='?', type=argparse.FileType('r'),
                        default=sys.stdin)
    args = parser.parse_args()

    print(args)

    with args.file as file:
        lines = [line.split(args.t) for line in file]

    lines = sorted(lines, key=lambda line: line[args.k-1])

    for line in lines:
        print(*line, sep=args.t, end='')


if __name__ == '__main__':
    main()
