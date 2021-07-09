#!/bin/sh

ARGS=("$@") # Capture all args passed in, for YAML config

source "/home/matt/venv/tf/bin/activate"

nb=${ARGS[0]} 

function conv(){
	jupyter nbconvert --to markdown $nb.ipynb
	#Pass in yaml tags if any.
	python edit.py ${nb%.ipynb}.md ${ARGS[@]:1}  
	mv ${nb%.ipynb}_files ../images/

}

conv
