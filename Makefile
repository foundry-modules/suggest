include ../../build/modules.mk

MODULE = suggest
FILENAME = ${MODULE}.js
RAWFILE = ${DEVELOPMENT_DIR}/${MODULE}.raw.js

SOURCE = ${SOURCE_DIR}/module_intro.js \
${SOURCE_DIR}/jquery.${MODULE}.js \
${SOURCE_DIR}/module_outro.js

PRODUCTION = ${PRODUCTION_DIR}/${FILENAME}
DEVELOPMENT = ${DEVELOPMENT_DIR}/${FILENAME}
PRODUCTION_FOLDER = ${PRODUCTION_DIR}/${MODULE}
DEVELOPMENT_FOLDER = ${DEVELOPMENT_DIR}/${MODULE}

all: raw module min clean

raw:
	cat ${SOURCE} > ${RAWFILE}

module:
	${MODULARIZE} -n "${MODULE}" -m ${RAWFILE} > ${DEVELOPMENT}

	mkdir -p ${DEVELOPMENT_FOLDER}
	cp ${SOURCE_DIR}/suggest.contextmenu.ejs ${DEVELOPMENT_FOLDER}/suggest.contextmenu.htm
	cp ${SOURCE_DIR}/suggest.contextmenu.item.ejs ${DEVELOPMENT_FOLDER}/suggest.contextmenu.item.htm

min:
	${UGLIFYJS} ${DEVELOPMENT} > ${PRODUCTION}

	mkdir -p ${PRODUCTION_FOLDER}
	cp ${SOURCE_DIR}/suggest.contextmenu.ejs ${PRODUCTION_FOLDER}/suggest.contextmenu.htm
	cp ${SOURCE_DIR}/suggest.contextmenu.item.ejs ${PRODUCTION_FOLDER}/suggest.contextmenu.item.htm

clean:
	rm -fr ${RAWFILE}
