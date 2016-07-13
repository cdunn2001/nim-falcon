import graph_to_utgs as M
import sequtils
import unittest

suite "basic":
  test "reverse complement":
    check:
      M.rc("Gattaca") == "tgtaatC"
