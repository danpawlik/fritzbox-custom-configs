FROM fedora:35

RUN yum update -y

RUN dnf -y groupinstall 'Development Tools' 'Development Libraries'

RUN dnf -y install pv rsync kmod execstack sqlite.i686 sqlite-devel \
      libzstd-devel.i686 cmake zlib-devel.i686 libstdc++-devel.x86_64 \
      libstdc++-devel.i686 openssl xz bc unar inkscape ImageMagick \
      subversion ccache gcc gcc-c++ binutils autoconf automake \
      libtool make bzip2 ncurses-devel ncurses-term zlib-devel flex \
      bison patch texinfo gettext pkgconfig ecj perl perl-String-CRC32 \
      wget glib2-devel git libacl-devel libattr-devel libcap-devel \
      ncurses-devel.i686 glibc-devel.i686 libgcc.i686

RUN useradd -m user && \
    echo 'user ALL=NOPASSWD: ALL' > /etc/sudoers.d/user

USER user
WORKDIR /home/user

# set dummy git config
RUN git config --global user.name "user" && git \
    config --global user.email "user@example.com"
