from distutils.core import setup
from Cython.Build import cythonize
import numpy


setup(name="fm_data",
      ext_modules=cythonize("fm_data.pyx",
                            language="c++"),
      include_dirs=[numpy.get_include()]
      )
