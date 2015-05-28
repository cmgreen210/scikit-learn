

cdef extern from "src/fm_core/fm_model.h":
    cdef cppclass fm_model:
        cdef double w0
