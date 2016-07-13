type
  seq_coor_t* = cint
  alignment* {.importc: "alignment", header: "common.h".} = object
    aln_str_size* {.importc: "aln_str_size".}: seq_coor_t
    dist* {.importc: "dist".}: seq_coor_t
    aln_q_s* {.importc: "aln_q_s".}: seq_coor_t
    aln_q_e* {.importc: "aln_q_e".}: seq_coor_t
    aln_t_s* {.importc: "aln_t_s".}: seq_coor_t
    aln_t_e* {.importc: "aln_t_e".}: seq_coor_t
    q_aln_str* {.importc: "q_aln_str".}: cstring
    t_aln_str* {.importc: "t_aln_str".}: cstring

  d_path_data* {.importc: "d_path_data", header: "common.h".} = object
    pre_k* {.importc: "pre_k".}: seq_coor_t
    x1* {.importc: "x1".}: seq_coor_t
    y1* {.importc: "y1".}: seq_coor_t
    x2* {.importc: "x2".}: seq_coor_t
    y2* {.importc: "y2".}: seq_coor_t

  d_path_data2* {.importc: "d_path_data2", header: "common.h".} = object
    d* {.importc: "d".}: seq_coor_t
    k* {.importc: "k".}: seq_coor_t
    pre_k* {.importc: "pre_k".}: seq_coor_t
    x1* {.importc: "x1".}: seq_coor_t
    y1* {.importc: "y1".}: seq_coor_t
    x2* {.importc: "x2".}: seq_coor_t
    y2* {.importc: "y2".}: seq_coor_t

  path_point* {.importc: "path_point", header: "common.h".} = object
    x* {.importc: "x".}: seq_coor_t
    y* {.importc: "y".}: seq_coor_t

  kmer_lookup* {.importc: "kmer_lookup", header: "common.h".} = object
    start* {.importc: "start".}: seq_coor_t
    last* {.importc: "last".}: seq_coor_t
    count* {.importc: "count".}: seq_coor_t

  base* = cuchar
  seq_array* = ptr base
  seq_addr* = seq_coor_t
  seq_addr_array* = ptr seq_addr
  kmer_match* {.importc: "kmer_match", header: "common.h".} = object
    count* {.importc: "count".}: seq_coor_t
    query_pos* {.importc: "query_pos".}: ptr seq_coor_t
    target_pos* {.importc: "target_pos".}: ptr seq_coor_t

  aln_range* {.importc: "aln_range", header: "common.h".} = object
    s1* {.importc: "s1".}: seq_coor_t
    e1* {.importc: "e1".}: seq_coor_t
    s2* {.importc: "s2".}: seq_coor_t
    e2* {.importc: "e2".}: seq_coor_t
    score* {.importc: "score".}: clong

  consensus_data* {.importc: "consensus_data", header: "common.h".} = object
    sequence* {.importc: "sequence".}: cstring
    eqv* {.importc: "eqv".}: ptr cint


proc allocate_kmer_lookup*(a2: seq_coor_t): ptr kmer_lookup {.cdecl,
    importc: "allocate_kmer_lookup", header: "common.h".}
proc init_kmer_lookup*(a2: ptr kmer_lookup; a3: seq_coor_t) {.cdecl,
    importc: "init_kmer_lookup", header: "common.h".}
proc free_kmer_lookup*(a2: ptr kmer_lookup) {.cdecl, importc: "free_kmer_lookup",
    header: "common.h".}
proc allocate_seq*(a2: seq_coor_t): seq_array {.cdecl, importc: "allocate_seq",
    header: "common.h".}
proc init_seq_array*(a2: seq_array; a3: seq_coor_t) {.cdecl,
    importc: "init_seq_array", header: "common.h".}
proc free_seq_array*(a2: seq_array) {.cdecl, importc: "free_seq_array",
                                   header: "common.h".}
proc allocate_seq_addr*(size: seq_coor_t): seq_addr_array {.cdecl,
    importc: "allocate_seq_addr", header: "common.h".}
proc free_seq_addr_array*(a2: seq_addr_array) {.cdecl,
    importc: "free_seq_addr_array", header: "common.h".}
proc find_best_aln_range*(a2: ptr kmer_match; a3: seq_coor_t; a4: seq_coor_t;
                         a5: seq_coor_t): ptr aln_range {.cdecl,
    importc: "find_best_aln_range", header: "common.h".}
proc free_aln_range*(a2: ptr aln_range) {.cdecl, importc: "free_aln_range",
                                      header: "common.h".}
proc find_kmer_pos_for_seq*(a2: cstring; a3: seq_coor_t; K: cuint; a5: seq_addr_array;
                           a6: ptr kmer_lookup): ptr kmer_match {.cdecl,
    importc: "find_kmer_pos_for_seq", header: "common.h".}
proc free_kmer_match*(`ptr`: ptr kmer_match) {.cdecl, importc: "free_kmer_match",
    header: "common.h".}
proc add_sequence*(a2: seq_coor_t; a3: cuint; a4: cstring; a5: seq_coor_t;
                  a6: seq_addr_array; a7: seq_array; a8: ptr kmer_lookup) {.cdecl,
    importc: "add_sequence", header: "common.h".}
proc mask_k_mer*(a2: seq_coor_t; a3: ptr kmer_lookup; a4: seq_coor_t) {.cdecl,
    importc: "mask_k_mer", header: "common.h".}
proc align*(a2: cstring; a3: seq_coor_t; a4: cstring; a5: seq_coor_t; a6: seq_coor_t;
           a7: cint): ptr alignment {.cdecl, importc: "align", header: "common.h".}
proc free_alignment*(a2: ptr alignment) {.cdecl, importc: "free_alignment",
                                      header: "common.h".}
proc free_consensus_data*(a2: ptr consensus_data) {.cdecl,
    importc: "free_consensus_data", header: "common.h".}
#[
]#
