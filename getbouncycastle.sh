bcprovjar=bcprov-ext-jdk15on-150.jar

cd lib &&
wget http://www.bouncycastle.org/download/${bcprovjar} &&
if ( gsha512sum -c ${bcprovjar}.sha512sum ) then
    cd .. &&
    ln -fs "lib/${bcprovjar}" bcprov.jar
else
    mv ${bcprovjar} ${bcprovjar}.invalid
    echo "SHA512 did not match; renamed ${bcprovjar}"
    false
fi
