#!/bin/bash

MATLAB="matlab"

SCRIPT1="primatest_1.m"
SCRIPT2="primatest_2.m"
SCRIPT3="primatest_3.m"
SCRIPT4="primatest_4.m"

echo "=== Running Primatest 1 ==="
$MATLAB -batch "run('${SCRIPT1}')"
if [ $? -ne 0 ]; then
    echo "Error: Primatest 1 failed."
    exit 1
fi

echo "=== Primatest 1 finished. Starting Primatest 2 ==="
$MATLAB -batch "run('${SCRIPT2}')"
if [ $? -ne 0 ]; then
    echo "Error: Primatest 2 failed."
    exit 1
fi

echo "=== Primatest 2 finished. Starting Primatest 3 ==="
$MATLAB -batch "run('${SCRIPT3}')"
if [ $? -ne 0 ]; then
    echo "Error: Primatest 3 failed."
    exit 1
fi

echo "=== Primatest 3 finished. Starting Primatest 4 ==="
$MATLAB -batch "run('${SCRIPT4}')"
if [ $? -ne 0 ]; then
    echo "Error: Primatest 4 failed."
    exit 1
fi
echo "=== All tests completed successfully ==="
