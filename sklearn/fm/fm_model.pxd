
cdef extern from "src/fm_core/fm_model.h":
    cdef cppclass fm_model:
        unsigned int num_attribute
        bint k0
        bint k1
        int num_factor

        double reg0
        double regw
        double regv

        double init_stdev
        double init_mean

        fm_model()
        void init()
