#ifdef C2NIM
#  dynlib falcon_kit_so
#  cdecl
#@
const falcon_kit_so = "c/libfalcon_kit.dylib"
@#
#endif

typedef int seq_coor_t; 

typedef struct {    
    seq_coor_t aln_str_size ;
    seq_coor_t dist ;
    seq_coor_t aln_q_s;
    seq_coor_t aln_q_e;
    seq_coor_t aln_t_s;
    seq_coor_t aln_t_e;
    char * q_aln_str;
    char * t_aln_str;

} alignment;


typedef struct {
    seq_coor_t pre_k;
    seq_coor_t x1;
    seq_coor_t y1;
    seq_coor_t x2;
    seq_coor_t y2;
} d_path_data;

typedef struct {
    seq_coor_t d;
    seq_coor_t k;
    seq_coor_t pre_k;
    seq_coor_t x1;
    seq_coor_t y1;
    seq_coor_t x2;
    seq_coor_t y2;
} d_path_data2;

typedef struct {
    seq_coor_t x;
    seq_coor_t y;
} path_point;

typedef struct {    
    seq_coor_t start;
    seq_coor_t last;
    seq_coor_t count;
} kmer_lookup;

typedef unsigned char base;
typedef base * seq_array;
typedef seq_coor_t seq_addr;
typedef seq_addr * seq_addr_array;


typedef struct {
    seq_coor_t count;
    seq_coor_t * query_pos;
    seq_coor_t * target_pos;
} kmer_match;


typedef struct {
    seq_coor_t s1;
    seq_coor_t e1;
    seq_coor_t s2;
    seq_coor_t e2;
    long int score;
} aln_range;


typedef struct {
    char * sequence;
    int * eqv;
} consensus_data;

kmer_lookup * allocate_kmer_lookup (seq_coor_t);
void init_kmer_lookup ( kmer_lookup *,  seq_coor_t );
void free_kmer_lookup(kmer_lookup *);

seq_array allocate_seq(seq_coor_t);
void init_seq_array( seq_array, seq_coor_t);
void free_seq_array(seq_array);

seq_addr_array allocate_seq_addr(seq_coor_t size); 

void free_seq_addr_array(seq_addr_array);


aln_range *  find_best_aln_range(kmer_match *, 
                              seq_coor_t, 
                              seq_coor_t, 
                              seq_coor_t); 

void free_aln_range( aln_range *);

kmer_match * find_kmer_pos_for_seq( char *, 
                                    seq_coor_t, 
                                    unsigned int K, 
                                    seq_addr_array, 
                                    kmer_lookup * );

void free_kmer_match( kmer_match * ptr);



void add_sequence ( seq_coor_t, 
                    unsigned int, 
                    char *, 
                    seq_coor_t,
                    seq_addr_array, 
                    seq_array, 
                    kmer_lookup *); 

void mask_k_mer(seq_coor_t, kmer_lookup *, seq_coor_t);

alignment * align(char *, seq_coor_t,
                  char *, seq_coor_t,
                  seq_coor_t,
                  int); 

void free_alignment(alignment *);


void free_consensus_data(consensus_data *);
