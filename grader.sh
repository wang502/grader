#! /bin/bash

# Switch to the grader directory
cd /grader

cat ./solutions/testcase.txt | python ./submissions/square.py > submissionOutput.txt

# Check if the learner's program ran successfully
if [ ! $? -eq 0 ]; then
	echo "{ \"fractionalScore\": 0.0, \"feedback\":\"Your submission produced runtime errors\" }"
	exit 0
fi

python grader.py ./solutions/solution.txt submissionOutput.txt
