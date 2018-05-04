#!/bin/bash
echo "rnpt-sp 6 ḫr ḥm n Ḥr sšm tꜢwj nswt-bjtj ḪꜤ-ḫpr-RꜤ rḫt n ꜤꜢmw jn.n sꜢ ḥꜢtj-Ꜥ H̱nmw-ḥtp(.w) ḥr msdmt m ꜤꜢmw n Šw rḫt jr 37" > _test.txt
hb-view --font-file $1 --text-file _test.txt --output-file "_$1.png"
