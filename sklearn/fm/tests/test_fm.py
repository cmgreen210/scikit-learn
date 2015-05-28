import numpy as np

from sklearn.utils.testing import assert_warns
from sklearn.utils.testing import assert_equal
from sklearn.utils.testing import assert_greater
from sklearn.utils.testing import assert_less
from sklearn.utils.testing import assert_raises
from sklearn.utils.testing import assert_almost_equal
from sklearn.utils.testing import assert_array_almost_equal

from sklearn.fm import fm_data


def test_vectordouble():
    a = np.array([1.0, 3.14], dtype=np.float)
    v = fm_data.VectorDouble(a)

    assert_equal(v.length(), a.shape[0])
    assert_equal(v[0], 1.0)

    assert_raises(OverflowError, v.__getitem__, -1)
    assert_raises(IndexError, v.__getitem__, 2)


def test_matrixdouble():
    m = np.array([[1.0, -1.0, -2.0],
                  [-1.4, -1.0, 2.0],
                  [1.0, -11, -2.0],
                  [1.0, -21, 20]], dtype=np.float)
    mat = fm_data.MatrixDouble(m)

    assert_equal(m[0, 1], mat[0, 1])
    assert_equal(m[3, 1], mat[3, 1])

    assert_raises(OverflowError, mat.__getitem__, (-1, 0))
    assert_raises(IndexError, mat.__getitem__, (3, 3))


if __name__ == '__main__':
    import nose
    nose.runmodule()