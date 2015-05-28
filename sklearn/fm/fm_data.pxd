
cdef extern from "src/util/matrix.h":
    cdef cppclass DVectorDouble:

        double * value
        unsigned int dim

        DVectorDouble()

        void setSize(unsigned int)

        double get(unsigned int)

    cdef cppclass DMatrixDouble:
        double ** value
        unsigned int dim1
        unsigned int dim2

        DMatrixDouble()
        void setSize(unsigned int dim1, unsigned int dim1)
        double get(unsigned int x, unsigned int y)
