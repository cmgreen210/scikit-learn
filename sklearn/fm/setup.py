from distutils.core import setup, Extension
from Cython.Distutils import build_ext
from Cython.Build import cythonize
import numpy


setup(name="fm",
      cmdclass={'build_ext': build_ext},
      ext_modules=cythonize("*.pyx",
                            language="c++"),
      include_dirs=[numpy.get_include()],
      )
