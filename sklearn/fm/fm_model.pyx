# distutils: language = c++
cimport fm_model

cdef class FMModel:
    cdef fm_model *_thisptr

    def __cinit__(self, param_init_stdev=0.1):
        self._thisptr = new fm_model()
        if self._thisptr == NULL:
            raise MemoryError()

        self._thisptr.init()