#include "c/common.h"

int main() {
  const int K = 8;
  allocate_kmer_lookup( 1 << (K * 2) );
  return 0;
}
