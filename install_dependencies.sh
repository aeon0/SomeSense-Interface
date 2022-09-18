# Install Capnp as explained here: https://capnproto.org/install.html
CAPNP_VERSION=`capnp --version`
if [[ "$CAPNP_VERSION" == "Cap'n Proto version 0.8."* ]]; then
  echo "Cap'n Proto version 0.8.* already installed"
else
  echo "Install Capnp..."
  VERSION=0.8.0
  curl -O https://capnproto.org/capnproto-c++-${VERSION}.tar.gz
  tar xvf capnproto-c++-${VERSION}.tar.gz
  cd capnproto-c++-${VERSION}
  ./configure
  make -j$(nproc)
  sudo make install
  sudo ldconfig
  rm -rf capnproto-c++-${VERSION}
  rm -rf capnproto-c++-${VERSION}.tar.gz
fi
