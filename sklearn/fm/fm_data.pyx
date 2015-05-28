# distutils: language = c++
import cython
cimport fm_data
from cpython.array cimport array
from libc.stdlib cimport malloc
import numpy as np
cimport numpy as np

np.import_array()

cdef class VectorDouble:

    cdef DVectorDouble *_thisptr

    def __cinit__(self,
                  np.ndarray[np.double_t, ndim=1, mode="c"] v):
        self._thisptr = new DVectorDouble()
        if self._thisptr == NULL:
            raise MemoryError()
        self._thisptr.setSize(v.shape[0])
        self._thisptr.value = &v[0]

    def __dealloc__(self):
        if self._thisptr != NULL:
            del self._thisptr

    cpdef length(self):
        return self._thisptr.dim

    def get(self, unsigned int x):
        if x > (self.length() - 1):
            raise IndexError("Index out of range!")
        return self._thisptr.get(x)

cdef class MatrixDouble:
    cdef DMatrixDouble *_thisptr

    def __cinit__(self,
                  np.ndarray[double, ndim=2, mode="c"] mat):
        cdef int n_rows, n_cols

        self._thisptr = new DMatrixDouble()
        if self._thisptr == NULL:
            raise MemoryError()

        n_rows, n_cols = mat.shape[0], mat.shape[1]
        cdef double** data
        data = <double **>malloc(n_rows*sizeof(double*))

        cdef unsigned int i
        for i in xrange(n_rows):
            data[i] = &(<double *>mat.data)[i * n_cols]

        self._thisptr.setSize(n_rows, n_cols)
        self._thisptr.value = data

    def __dealloc__(self):
        if self._thisptr != NULL:
            del self._thisptr

    def get(self, unsigned int x, unsigned int y):
        cdef int dim1 = self._thisptr.dim1
        cdef int dim2 = self._thisptr.dim2
        if x >= dim1 or y >= dim2:
            raise IndexError("Index out of range")
        return self._thisptr.get(x, y)