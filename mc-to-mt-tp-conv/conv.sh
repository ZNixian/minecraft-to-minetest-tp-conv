#!/bin/bash
cd "$(dirname "$0")"
cd ..
rm -rf minetest-texture-pack
rm -rf uctextures
mkdir textures
mkdir uctextures
cd uctextures
mkdir b
mkdir i
cd ..


FILES=$(dirname "$0")/../assets/minecraft/textures/blocks/*.png
for f in $FILES
do
	cp $f "uctextures/b/"
done

FILES=$(dirname "$0")/../assets/minecraft/textures/items/*.png
for f in $FILES
do
	cp $f "uctextures/i/"
done

cd uctextures

while read p; do
	if [ -n "$p" ]
	then
		if [ -e "trans.png" ]
		then
			mv trans.png "../textures/$p"
		else
			mv "$p" trans.png
		fi
	fi
done < ../mc-to-mt-tp-conv/transtable.txt


#####################################
convert "b/destroy_stage_0.png" \
	"b/destroy_stage_1.png" \
	"b/destroy_stage_2.png" \
	"b/destroy_stage_3.png" \
	"b/destroy_stage_4.png" \
	"b/destroy_stage_5.png" \
	"b/destroy_stage_6.png" \
	"b/destroy_stage_7.png" \
	"b/destroy_stage_8.png" \
	"b/destroy_stage_9.png" \
			+append "../textures/crack-anylength.png"
#####################################

cd ..

mv textures minetest-texture-pack