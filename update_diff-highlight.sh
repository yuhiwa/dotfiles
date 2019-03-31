#!/bin/bash -x

base=$(cd $(dirname $0); pwd)

clone() {
    cd $base
    git clone https://github.com/git/git.git
}

build() {
    cd $base/git/contrib/diff-highlight
    make
}

update() {
    cp $base/git/contrib/diff-highlight/diff-highlight \
        $base/diff-highlight
}

clean() {
    rm -rf $base/git
}

clone
build
update
clean
