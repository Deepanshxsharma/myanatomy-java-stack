#!/usr/bin/env bash
set -e

cd "$(dirname "$0")"

echo "============================================"
echo "  Compiling Multi-Threaded File Processor"
echo "============================================"

mkdir -p out

javac -d out src/Main.java src/model/SalesRecord.java src/config/ProcessorConfig.java src/processor/CsvFileProcessor.java src/report/ReportAggregator.java

echo
echo "Compilation successful!"
echo
echo "============================================"
echo "  Running the Program"
echo "============================================"
echo

java -cp out Main
