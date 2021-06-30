#!/bin/bash
# This file is generated as part of build.xml
FR_DIR="`pwd`/`dirname $0`/"
if [[ ! -d "${FR_DIR}download/" ]]; then
	mkdir "${FR_DIR}download/"
fi
if [[ ! -d "${FR_DIR}build/tmp/build/" ]]; then
	mkdir -p "${FR_DIR}build/tmp/build"
fi
FR_DIR="`pwd`/`dirname $0`/"
DOWNLOAD_HELP="download https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u252-b09/OpenJDK8U-jdk_x64_linux_hotspot_8u252b09.tar.gz manually, move it to ${FR_DIR}download and restart this script"
if [[ ! -f "${FR_DIR}download/OpenJDK8U-jdk_x64_linux_hotspot_8u252b09.tar.gz" ]]; then
	echo In case of errors ${DOWNLOAD_HELP}
	curl -f -o "${FR_DIR}download/OpenJDK8U-jdk_x64_linux_hotspot_8u252b09.tar.gz.tmp" -L https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u252-b09/OpenJDK8U-jdk_x64_linux_hotspot_8u252b09.tar.gz
	retVal=$?
	if [[ $retVal -ne 0 ]]; then
		echo "Please ${DOWNLOAD_HELP}"
		exit $retVal
	fi
	mv "${FR_DIR}download/OpenJDK8U-jdk_x64_linux_hotspot_8u252b09.tar.gz.tmp" "${FR_DIR}/download/OpenJDK8U-jdk_x64_linux_hotspot_8u252b09.tar.gz"
fi
if [[ ! -d "${FR_DIR}build/openjdk-8u252-b09/" ]]; then
	tar --exclude=*/demo --exclude=*/sample --exclude=*/manual --exclude=*/src.zip -xzvf "${FR_DIR}download/OpenJDK8U-jdk_x64_linux_hotspot_8u252b09.tar.gz" -C "${FR_DIR}build/tmp/build"
	retVal=$?
	if [[ $retVal -ne 0 ]]; then
		echo "Please ${DOWNLOAD_HELP}"
		exit $retVal
	fi
	mv "${FR_DIR}build/tmp/build/openjdk-8u252-b09" "${FR_DIR}build/openjdk-8u252-b09"
fi
FR_DIR="`pwd`/`dirname $0`/"
DOWNLOAD_HELP="download https://archive.apache.org/dist/ant/binaries/apache-ant-1.10.10-bin.tar.gz manually, move it to ${FR_DIR}download and restart this script"
if [[ ! -f "${FR_DIR}download/apache-ant-1.10.10-bin.tar.gz" ]]; then
	echo In case of errors ${DOWNLOAD_HELP}
	curl -f -o "${FR_DIR}download/apache-ant-1.10.10-bin.tar.gz.tmp" -L https://archive.apache.org/dist/ant/binaries/apache-ant-1.10.10-bin.tar.gz
	retVal=$?
	if [[ $retVal -ne 0 ]]; then
		echo "Please ${DOWNLOAD_HELP}"
		exit $retVal
	fi
	mv "${FR_DIR}download/apache-ant-1.10.10-bin.tar.gz.tmp" "${FR_DIR}/download/apache-ant-1.10.10-bin.tar.gz"
fi
if [[ ! -d "${FR_DIR}build/apache-ant-1.10.10/" ]]; then
	tar --exclude=*/demo --exclude=*/sample --exclude=*/manual --exclude=*/src.zip -xzvf "${FR_DIR}download/apache-ant-1.10.10-bin.tar.gz" -C "${FR_DIR}build/tmp/build"
	retVal=$?
	if [[ $retVal -ne 0 ]]; then
		echo "Please ${DOWNLOAD_HELP}"
		exit $retVal
	fi
	mv "${FR_DIR}build/tmp/build/apache-ant-1.10.10" "${FR_DIR}build/apache-ant-1.10.10"
fi
JAVA_HOME="${FR_DIR}build/openjdk-8u252-b09"
ANT_HOME="${FR_DIR}build/apache-ant-1.10.10"
"${FR_DIR}build/apache-ant-1.10.10/bin/ant" -emacs -buildfile "${FR_DIR}build.xml" "$@" start