 {.deadCodeElim: on.}
const falcon_kit_so = "c/libfalcon_kit.dylib"
type
  seq_coor_t* = cint
  alignment* = object
    aln_str_size*: seq_coor_t
    dist*: seq_coor_t
    aln_q_s*: seq_coor_t
    aln_q_e*: seq_coor_t
    aln_t_s*: seq_coor_t
    aln_t_e*: seq_coor_t
    q_aln_str*: cstring
    t_aln_str*: cstring

  d_path_data* = object
    pre_k*: seq_coor_t
    x1*: seq_coor_t
    y1*: seq_coor_t
    x2*: seq_coor_t
    y2*: seq_coor_t

  d_path_data2* = object
    d*: seq_coor_t
    k*: seq_coor_t
    pre_k*: seq_coor_t
    x1*: seq_coor_t
    y1*: seq_coor_t
    x2*: seq_coor_t
    y2*: seq_coor_t

  path_point* = object
    x*: seq_coor_t
    y*: seq_coor_t

  kmer_lookup* = object
    start*: seq_coor_t
    last*: seq_coor_t
    count*: seq_coor_t

  base* = cuchar
  seq_array* = ptr base
  seq_addr* = seq_coor_t
  seq_addr_array* = ptr seq_addr
  kmer_match* = object
    count*: seq_coor_t
    query_pos*: ptr seq_coor_t
    target_pos*: ptr seq_coor_t

  aln_range* = object
    s1*: seq_coor_t
    e1*: seq_coor_t
    s2*: seq_coor_t
    e2*: seq_coor_t
    score*: clong

  consensus_data* = object
    sequence*: cstring
    eqv*: ptr cint


proc allocate_kmer_lookup*(a2: seq_coor_t): ptr kmer_lookup {.cdecl,
    importc: "allocate_kmer_lookup", dynlib: falcon_kit_so.}
proc init_kmer_lookup*(a2: ptr kmer_lookup; a3: seq_coor_t) {.cdecl,
    importc: "init_kmer_lookup", dynlib: falcon_kit_so.}
proc free_kmer_lookup*(a2: ptr kmer_lookup) {.cdecl, importc: "free_kmer_lookup",
    dynlib: falcon_kit_so.}
proc allocate_seq*(a2: seq_coor_t): seq_array {.cdecl, importc: "allocate_seq",
    dynlib: falcon_kit_so.}
proc init_seq_array*(a2: seq_array; a3: seq_coor_t) {.cdecl,
    importc: "init_seq_array", dynlib: falcon_kit_so.}
proc free_seq_array*(a2: seq_array) {.cdecl, importc: "free_seq_array",
                                   dynlib: falcon_kit_so.}
proc allocate_seq_addr*(size: seq_coor_t): seq_addr_array {.cdecl,
    importc: "allocate_seq_addr", dynlib: falcon_kit_so.}
proc free_seq_addr_array*(a2: seq_addr_array) {.cdecl,
    importc: "free_seq_addr_array", dynlib: falcon_kit_so.}
proc find_best_aln_range*(a2: ptr kmer_match; a3: seq_coor_t; a4: seq_coor_t;
                         a5: seq_coor_t): ptr aln_range {.cdecl,
    importc: "find_best_aln_range", dynlib: falcon_kit_so.}
proc free_aln_range*(a2: ptr aln_range) {.cdecl, importc: "free_aln_range",
                                      dynlib: falcon_kit_so.}
proc find_kmer_pos_for_seq*(a2: cstring; a3: seq_coor_t; K: cuint; a5: seq_addr_array;
                           a6: ptr kmer_lookup): ptr kmer_match {.cdecl,
    importc: "find_kmer_pos_for_seq", dynlib: falcon_kit_so.}
proc free_kmer_match*(`ptr`: ptr kmer_match) {.cdecl, importc: "free_kmer_match",
    dynlib: falcon_kit_so.}
proc add_sequence*(a2: seq_coor_t; a3: cuint; a4: cstring; a5: seq_coor_t;
                  a6: seq_addr_array; a7: seq_array; a8: ptr kmer_lookup) {.cdecl,
    importc: "add_sequence", dynlib: falcon_kit_so.}
proc mask_k_mer*(a2: seq_coor_t; a3: ptr kmer_lookup; a4: seq_coor_t) {.cdecl,
    importc: "mask_k_mer", dynlib: falcon_kit_so.}
proc align*(a2: cstring; a3: seq_coor_t; a4: cstring; a5: seq_coor_t; a6: seq_coor_t;
           a7: cint): ptr alignment {.cdecl, importc: "align", dynlib: falcon_kit_so.}
proc free_alignment*(a2: ptr alignment) {.cdecl, importc: "free_alignment",
                                      dynlib: falcon_kit_so.}
proc free_consensus_data*(a2: ptr consensus_data) {.cdecl,
    importc: "free_consensus_data", dynlib: falcon_kit_so.}