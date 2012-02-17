SRC_DIR = source
BUILD_DIR = build
FOUNDRY_DIR = ../..
PRODUCTION_DIR = ${FOUNDRY_DIR}/scripts
DEVELOPMENT_DIR = ${FOUNDRY_DIR}/scripts_
UGLIFY = uglifyjs --unsafe -nc

BASE_FILES = ${FOUNDRY_DIR}/build/foundry_intro.js \
${SRC_DIR}/module_intro.js \
${SRC_DIR}/jquery.suggest.js \
${SRC_DIR}/module_outro.js \
${FOUNDRY_DIR}/build/foundry_outro.js

all: body min

body:
	cat ${BASE_FILES} > ${DEVELOPMENT_DIR}/suggest.js
	mkdir -p ${DEVELOPMENT_DIR}/suggest
	cp ${SRC_DIR}/*.ejs ${DEVELOPMENT_DIR}/suggest/

min:
	${UGLIFY} ${DEVELOPMENT_DIR}/suggest.js > ${PRODUCTION_DIR}/suggest.js
	mkdir -p ${PRODUCTION_DIR}/suggest
	cp ${SRC_DIR}/*.ejs ${PRODUCTION_DIR}/suggest/
